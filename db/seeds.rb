# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Transaction.destroy_all
InvoiceItem.destroy_all
Item.destroy_all
Invoice.destroy_all
Coupon.destroy_all
Merchant.destroy_all
Customer.destroy_all
Rake::Task["csv_load:all"].invoke

@merchant1 = Merchant.create!(name: "Dolly Parton")
@merchant2 = Merchant.create!(name: "Jewel")
@coupon1 = @merchant1.coupons.create!(name: "10 Sale!", unique_code: "10%OFF", disc_amount: 10, disc_type: 1, status: 1)
@coupon2 = @merchant1.coupons.create!(name: "Summer Five-O", unique_code: "5%OFF", disc_amount: 5, disc_type: 1, status: 1)
@coupon3 = @merchant1.coupons.create!(name: "Fifteeny!", unique_code: "15%OFF", disc_amount: 15, disc_type: 1, status: 1)
@coupon4 = @merchant1.coupons.create!(name: "Ten Dollars For You!", unique_code: "10$OFF", disc_amount: 10, disc_type: 0, status: 1)
@coupon5 = @merchant1.coupons.create!(name: "Summer Sale", unique_code: "SUM12%OFF",disc_amount: 12, disc_type: 1, status: 1)
@coupon6 = @merchant1.coupons.create!(name: "Twelve Percent Off", unique_code: "12%OFF",disc_amount: 12, disc_type: 1, status: 0)
@coupon7 = @merchant2.coupons.create!(name: "Twelve Percent!!!", unique_code: "12%!OFF",disc_amount: 12, disc_type: 1, status: 1)
@coupon8 = @merchant2.coupons.create!(name: "10 Sale!!", unique_code: "10%!OFF", disc_amount: 10, disc_type: 1, status: 1)
@item_1 = Item.create!(name: "Shampoo", description: "This washes your hair", unit_price: 10, merchant_id: @merchant1.id, status: 1)
@item_2 = Item.create!(name: "Conditioner", description: "This makes your hair shiny", unit_price: 8, merchant_id: @merchant1.id)
@item_3 = Item.create!(name: "Brush", description: "This takes out tangles", unit_price: 5, merchant_id: @merchant1.id)
@item_4 = Item.create!(name: "Hair tie", description: "This holds up your hair", unit_price: 1, merchant_id: @merchant1.id)
@item_7 = Item.create!(name: "Scrunchie", description: "This holds up your hair but is bigger", unit_price: 3, merchant_id: @merchant1.id)
@item_8 = Item.create!(name: "Butterfly Clip", description: "This holds up your hair but in a clip", unit_price: 5, merchant_id: @merchant1.id)
@item_5 = Item.create!(name: "Bracelet", description: "Wrist bling", unit_price: 200, merchant_id: @merchant2.id)
@item_6 = Item.create!(name: "Necklace", description: "Neck bling", unit_price: 300, merchant_id: @merchant2.id)
@customer_1 = Customer.create!(first_name: "Joey", last_name: "Smith")
@customer_2 = Customer.create!(first_name: "Cecilia", last_name: "Jones")
@customer_3 = Customer.create!(first_name: "Mariah", last_name: "Carrey")
@customer_4 = Customer.create!(first_name: "Leigh Ann", last_name: "Bron")
@customer_5 = Customer.create!(first_name: "Sylvester", last_name: "Nader")
@customer_6 = Customer.create!(first_name: "Herber", last_name: "Kuhn")
@invoice_1 = @coupon1.invoices.create!(customer_id: @customer_1.id, status: 2)
@invoice_2 = @coupon2.invoices.create!(customer_id: @customer_1.id, status: 2)
@invoice_3 = @coupon1.invoices.create!(customer_id: @customer_2.id, status: 2)
@invoice_4 = @coupon1.invoices.create!(customer_id: @customer_3.id, status: 2)
@invoice_5 = @coupon3.invoices.create!(customer_id: @customer_4.id, status: 2)
@invoice_6 = @coupon4.invoices.create!(customer_id: @customer_5.id, status: 2)
@invoice_7 = Invoice.create!(customer_id: @customer_6.id, status: 1)
@invoice_8 = @coupon1.invoices.create!(customer_id: @customer_6.id, status: 2)
@ii_1 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_1.id, quantity: 9, unit_price: 10, status: 0, created_at: "2012-03-27 14:54:09")
@ii_2 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_1.id, quantity: 1, unit_price: 10, status: 0, created_at: "2012-03-29 14:54:09")
@ii_3 = InvoiceItem.create!(invoice_id: @invoice_3.id, item_id: @item_2.id, quantity: 2, unit_price: 8, status: 2, created_at: "2012-03-28 14:54:09")
@ii_4 = InvoiceItem.create!(invoice_id: @invoice_4.id, item_id: @item_3.id, quantity: 3, unit_price: 5, status: 1, created_at: "2012-03-30 14:54:09")
@ii_6 = InvoiceItem.create!(invoice_id: @invoice_5.id, item_id: @item_4.id, quantity: 1, unit_price: 1, status: 1, created_at: "2012-04-01 14:54:09")
@ii_7 = InvoiceItem.create!(invoice_id: @invoice_6.id, item_id: @item_7.id, quantity: 1, unit_price: 3, status: 1, created_at: "2012-04-02 14:54:09")
@ii_8 = InvoiceItem.create!(invoice_id: @invoice_7.id, item_id: @item_8.id, quantity: 1, unit_price: 5, status: 1, created_at: "2012-04-03 14:54:09")
@ii_9 = InvoiceItem.create!(invoice_id: @invoice_7.id, item_id: @item_4.id, quantity: 1, unit_price: 1, status: 1, created_at: "2012-04-04 14:54:09")
@ii_10 = InvoiceItem.create!(invoice_id: @invoice_8.id, item_id: @item_4.id, quantity: 1, unit_price: 1, status: 1, created_at: "2012-04-04 14:54:09")
@transaction1 = Transaction.create!(credit_card_number: 203942, result: 1, invoice_id: @invoice_1.id)
@transaction2 = Transaction.create!(credit_card_number: 230948, result: 1, invoice_id: @invoice_2.id)
@transaction3 = Transaction.create!(credit_card_number: 234092, result: 1, invoice_id: @invoice_3.id)
@transaction4 = Transaction.create!(credit_card_number: 230429, result: 1, invoice_id: @invoice_4.id)
@transaction5 = Transaction.create!(credit_card_number: 102938, result: 1, invoice_id: @invoice_5.id)
@transaction6 = Transaction.create!(credit_card_number: 879799, result: 0, invoice_id: @invoice_6.id)
@transaction7 = Transaction.create!(credit_card_number: 203942, result: 1, invoice_id: @invoice_7.id)
@transaction7 = Transaction.create!(credit_card_number: 203942, result: 1, invoice_id: @invoice_8.id)