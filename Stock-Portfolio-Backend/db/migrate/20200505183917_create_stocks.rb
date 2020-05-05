class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :company_name
      t.string :symbol
      t.decimal :day_open_price
      t.decimal :current_price
      t.decimal :day_close_price

      t.timestamps
    end
  end
end
