require 'rest-client'
class Stock < ApplicationRecord

    has_many :transactions, dependent: :destroy
    has_many :users, through: :transactions

    validates :company_name, presence:true, uniqueness:true
    validates :symbol, presence:true, uniqueness:true
    
    
    
    SECRET = ENV["TEST_API_SECRET"]

    URL = "https://sandbox.iexapis.com/stable/"
    
    def self.get_quote(stock)
        response = RestClient.get("#{URL}stock/#{stock.symbol}/quote?token=#{SECRET}")
        parsed = JSON.parse(response)
    end
    
    #to test
    def update_stock(stock_info)
        self.day_open_price = stock_info["open_price"]
    end
end
