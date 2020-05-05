class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  validates :sale_price, presence:true, numericality:true
  validates :quantity, presence:true, numericality:true
  validates :sale_total, presence:true, numericality:true
  validates :sale_type, presence:true
  #validate :sale_type_must_be_buy_or_sell

  def sale_type_must_be_buy_or_sell
    if(sale_type != "BUY" && sale_type != "SELL")
        errors.add(:sale_type, "must be 'BUY' or 'SELL'")
    end  
  end
end
