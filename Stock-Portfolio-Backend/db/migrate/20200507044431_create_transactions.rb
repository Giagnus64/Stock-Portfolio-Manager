class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :stock, null: false, foreign_key: true
      t.string :sale_type
      t.decimal :sale_price
      t.integer :quantity
      t.decimal :sale_total

      t.timestamps
    end
  end
end
