class Stock < ApplicationRecord
    has_many :transactions, dependent: :destroy
    has_many :users, through: :transactions

    validates :company_name, presence:true, uniqueness:true
    validates :symbol, presence:true, uniqueness:true
    
end
