require 'rest-client'
class User < ApplicationRecord
    has_many :transactions, dependent: :destroy
    has_many :stocks, through: :transactions
    
    has_secure_password
    
    validates :name, presence:true
    validates :email, uniqueness:true, presence:true
    validates :account_balance, presence:true

    def update_account_balance(sale_total)
        current_balance = self.account_balance
        new_balance = current_balance - sale_total
        self.update(account_balance: new_balance)
    end


    def get_portfolio
        portfolio = Hash.new()
        self.transactions.all.each do |transaction|
            if (portfolio[transaction.stock.company_name])
                
                portfolio[transaction.stock.company_name][:quantity] = portfolio[transaction.stock.company_name][:quantity] + transaction.quantity
            else
                stock_info = transaction.stock.get_quote()
                portfolio[transaction.stock.company_name] = {quantity: transaction.quantity, stock_info: stock_info}
            end
        end
        portfolio
    end
 
end
