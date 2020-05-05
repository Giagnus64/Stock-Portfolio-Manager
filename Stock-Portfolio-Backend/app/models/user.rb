class User < ApplicationRecord
    has_many :transactions, dependent: :destroy
    has_many :stocks, through: :transactions
    has_secure_password
    
    validates :name, presence:true
    validates :email, uniqueness:true, presence:true
    validates :account_balance, presence:true
end
