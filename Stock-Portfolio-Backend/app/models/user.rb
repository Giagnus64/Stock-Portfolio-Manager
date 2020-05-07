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
end
