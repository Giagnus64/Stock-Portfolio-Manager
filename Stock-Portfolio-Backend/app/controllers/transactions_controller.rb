class TransactionsController < ApplicationController

    def show
        user = User.find(params[:user_id])
        if(user)
            transactions = user.transactions
            render json: TransactionSerializer.new(transactions).to_serialized_json
        end

    end
end
