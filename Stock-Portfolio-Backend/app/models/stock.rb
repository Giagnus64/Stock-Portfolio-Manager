class Stock < ApplicationRecord
    has_many :transactions, dependent: :destroy
    has_many :users, through: :transactions

    validates :company_name, presence:true, uniqueness:true
    validates :stock_symbol, presence:true, uniqueness:true
    
    
    
    TEST_SECRET = ENV["TEST_API_SECRET"]

    TEST_URL = "https://sandbox.iexapis.com/stable/"
    
    def self.get_quote(stock_symbol)
        response = RestClient.get("#{TEST_URL}stock/#{stock_symbol}/quote?token=#{TEST_SECRET}")
        parsed = JSON.parse(response)
        Stock.handle_stock(parsed)
        return parsed["open"]
    end

    #think of batch requests later
    # def self.get_quote(stock)
    #     response = RestClient.get("#{TEST_URL}stock/#{stock.stock_symbol}/quote?token=#{TEST_SECRET}")
    #     #response = RestClient.get("#{TEST_URL}stock/#{stock.stock_symbol}/quote?token=#{SECRET}")
    #     parsed = JSON.parse(response)
    # end
    
    #handle new stocks or update stocks
    def self.handle_stock(stock_info)
        stock = Stock.find_by(stock_symbol:stock_info["symbol"])
        if stock
            Stock.update_stock_prices(stock, stock_info)
        else
            Stock.create_new_stock(stock_info)
        end
    end

    def self.create_new_stock(stock_info)
        Stock.create(stock_symbol:stock_info["symbol"],day_open_price:stock_info["open"], current_price:stock_info["iexRealtimePrice"], company_name: stock_info["companyName"], day_close_price:stock_info["close"])
    end


    def self.update_stock_prices(stock, stock_info)
        stock.update(day_open_price:stock_info["open"], current_price:stock_info["iexRealtimePrice"], day_close_price:stock_info["close"])
    end

end
