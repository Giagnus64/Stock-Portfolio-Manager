class TransactionsController < ApplicationController

    #get transactions by passing in user id
    def show
        user = User.find(params[:user_id])
        if(user.transactions.size != 0)
            transactions = user.transactions
            render json: TransactionSerializer.new(transactions).to_serialized_json
        else
            render json: [errors:"No transactions found for that user. Buy some stocks!"]
        end
    end

    def create
        #verify transaction server side
        transaction_details = Transaction.verify_buy_transaction(transaction_params[:user_id], transaction_params[:stock_id], transaction_params[:quantity])
        if(transaction_details[:new_user_balance] < 0)
            render json:[errors: "An error occured when submitting this transaction."]
        else
            new_trans_params = transaction_params
            new_trans_params[:sale_price] = transaction_details[:sale_price]
            new_trans_params[:sale_total] = transaction_details[:sale_total]            
            new_trans_params[:sale_type] = "BUY"            
            new_trans = Transaction.create(new_trans_params)
            if(new_trans.valid?)
                render json: new_trans, status: :created
            else
                #if an error occurs, print errors
                render json: {messages: new_trans.errors.full_messages}
            end
        end
    end

    private

    def transaction_params
        params.require(:transaction).permit(:user_id, :stock_id, :quantity)
    end
end
