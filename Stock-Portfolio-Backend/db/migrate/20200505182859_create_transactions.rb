class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.decimal :sale_price
      t.integer :quantity
      t.decimal :balance_before_transaction
      t.decimal :sale_total
      t.belongs_to :user, null: false, foreign_key: true
      t.string :sale_type
      

      t.timestamps
    end
  end
end
