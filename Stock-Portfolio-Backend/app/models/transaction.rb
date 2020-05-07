class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  validates :sale_price, presence:true, numericality:true
  validates :quantity, presence:true, numericality:true
  validates :sale_total, presence:true, numericality:true
  validates :sale_type, presence:true
  #validate :sale_type_must_be_buy_or_sell

#   def sale_type_must_be_buy_or_sell
#     if(sale_type != "BUY" && sale_type != "SELL")
#         errors.add(:sale_type, "must be 'BUY' or 'SELL'")
#     end  
#   end
  #verify transaction on backend in case of errors in front end
  def self.verify_buy_transaction(user_id, stock_id, quantity)
    transaction_details = Hash.new()
    user = User.find(user_id)
    transaction_details[:user_balance] = user.account_balance
    stock = Stock.find(stock_id)
    transaction_details[:sale_price] = stock.current_price
    transaction_details[:sale_total] = transaction_details[:sale_price] * quantity
    transaction_details[:new_user_balance] = transaction_details[:account_balance] - transaction_details[:sale_total]
    transaction_details
  end
end
