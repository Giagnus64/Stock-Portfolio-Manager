# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Transaction.destroy_all
User.destroy_all
Stock.destroy_all



u1 = User.create(email:"g@g.com", password: "ggg", name: "greg", account_balance:5000.00)
u2 = User.create(email:"a@a.com", password: "aaa", name: "ally", account_balance:5000.00)
u3 = User.create(email:"b@b.com", password: "bbb", name: "bob", account_balance:5000.00)
u4 = User.create(email:"c@c.com", password: "ccc", name: "cal", account_balance:5000.00)

apple = Stock.create(company_name: "Apple Inc", stock_symbol:"AAPL", day_open_price:295.06, current_price: 300.92)
disney = Stock.create(company_name:"The Walt Disney Company", stock_symbol: "DIS", day_open_price: 101.51, current_price: 101.38)
netflix = Stock.create(company_name:"Netflix,Inc", stock_symbol:"NFLX", day_open_price: 427.55, current_price:428.61)

t1 = Transaction.create(user:u1, stock:apple, quantity: 1, sale_type:"BUY", sale_price:300.92, sale_total:300.92)
t2 = Transaction.create(user:u1, stock:netflix, quantity: 5, sale_type:"BUY", sale_price:427.55, sale_total:(427.55 * 5))
t3 = Transaction.create(user:u2, stock:apple, quantity:10, sale_type:"BUY", sale_price:300.92, sale_total:(300.92 * 10))
t4 = Transaction.create(user:u3, stock:apple, quantity: 3, sale_type:"BUY", sale_price:300.92, sale_total:(300.92*5))
