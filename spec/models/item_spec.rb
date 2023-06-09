require "rails_helper"

RSpec.describe Item, type: :model do
  describe "relationships" do 
    load_test_data
    
    it { should belong_to(:merchant) }
    it { should have_many(:invoice_items) }
    it { should have_many(:invoices).through(:invoice_items) }
    it { should have_many(:customers).through(:invoices) }
    it { should have_many(:transactions).through(:invoices) }
  end 

  describe "instance method" do
    let!(:merchant) { create(:merchant, id: 1, name:"Dealer of Death", status: 1 )}
    let!(:merchant2) { create(:merchant, id: 2, name:"Dealer of Life", status: 1 )}
  
    let!(:item1) { create(:item, id: 1, merchant_id: 1, status: 1, name: "Mediocre Concrete Bench" )}
    let!(:item2) { create(:item, id: 2, merchant_id: 1, status: 0, name: "Ballpoint Pen" )}
    let!(:item3) { create(:item, id: 3, merchant_id: 1, status: 0, name: "Frieza Pod" )}
    let!(:item4) { create(:item, id: 4, merchant_id: 1, status: 1, name: "Heavy Duty Leather Pants" )}
    let!(:item5) { create(:item, id: 5, merchant_id: 1, status: 1, name: "Durable Marble Hat" )}
  
    let!(:item6) { create(:item, id: 6, merchant_id: 2 )}
    let!(:item7) { create(:item, id: 7, merchant_id: 2 )}
  
    let!(:customer1) { create(:customer, id: 1, first_name: "Austin" )}
    let!(:customer2) { create(:customer, id: 2, first_name: "Jimmy" )}
    let!(:customer3) { create(:customer, id: 3, first_name: "Garret" )}
    let!(:customer4) { create(:customer, id: 4, first_name: "Julian" )}
    let!(:customer5) { create(:customer, id: 5, first_name: "James" )}
    let!(:customer6) { create(:customer, id: 6, first_name: "John" )}
    let!(:customer7) { create(:customer, id: 7, first_name: "Jerry" )}
  
    let!(:invoice1) { create(:invoice, id: 1, created_at: "2012-03-25 09:54:09 UTC", customer_id: customer1.id )}
    let!(:invoice2) { create(:invoice, id: 2, created_at: "2012-05-25 09:54:09 UTC", customer_id: customer1.id )}
    let!(:invoice3) { create(:invoice, id: 3, created_at: "2012-07-25 09:54:09 UTC", customer_id: customer1.id )}
    let!(:invoice4) { create(:invoice, id: 4, created_at: "2012-09-25 09:54:09 UTC", customer_id: customer1.id )}
  
    let!(:invoice5) { create(:invoice, id: 5, created_at: "2013-03-25 09:54:09 UTC", customer_id: customer2.id )}
    let!(:invoice6) { create(:invoice, id: 6, created_at: "2013-05-25 09:54:09 UTC", customer_id: customer2.id )}
    let!(:invoice7) { create(:invoice, id: 7, created_at: "2013-06-25 09:54:09 UTC", customer_id: customer2.id )}
    let!(:invoice8) { create(:invoice, id: 8, created_at: "2013-12-25 09:54:09 UTC", customer_id: customer2.id )}
  
    let!(:invoice9) { create(:invoice, id: 9, created_at: "2012-01-25 09:54:09 UTC", customer_id: customer3.id )}
    let!(:invoice10) { create(:invoice, id: 10, created_at: "2012-04-25 09:54:09 UTC", customer_id: customer3.id )}
    let!(:invoice11) { create(:invoice, id: 11, created_at: "2012-11-25 09:54:09 UTC", customer_id: customer3.id )}
    let!(:invoice12) { create(:invoice, id: 12, created_at: "2012-10-25 09:54:09 UTC", customer_id: customer3.id )}
  
    let!(:invoice13) { create(:invoice, id: 13, created_at: "2012-10-15 09:54:09 UTC", customer_id: customer4.id )}
    let!(:invoice14) { create(:invoice, id: 14, created_at: "2012-08-25 09:54:09 UTC", customer_id: customer4.id )}
  
    let!(:invoice15) { create(:invoice, id: 15, created_at: "2012-06-20 09:54:09 UTC", customer_id: customer5.id )}
    let!(:invoice16) { create(:invoice, id: 16, created_at: "2012-12-05 09:54:09 UTC", customer_id: customer5.id )}
  
    let!(:invoice17) { create(:invoice, id: 17, created_at: "2012-01-06 09:54:09 UTC", customer_id: customer5.id )}
  
    let!(:invoice_item1) { create(:invoice_item, id: 1, status: 0,  item_id: item1.id, invoice_id: invoice1.id, unit_price: 1000, quantity: 25)}
    let!(:invoice_item2) { create(:invoice_item, id: 2, status: 1, item_id: item1.id, invoice_id: invoice2.id, unit_price: 2500, quantity: 50 )}
    let!(:invoice_item3) { create(:invoice_item, id: 3, status: 1, item_id: item1.id, invoice_id: invoice3.id, unit_price: 750, quantity: 35 )}
    let!(:invoice_item4) { create(:invoice_item, id: 4, status: 2, item_id: item6.id, invoice_id: invoice4.id, unit_price: 1500, quantity: 15 )}
  
    let!(:invoice_item5) { create(:invoice_item, id: 5, status: 0, item_id: item2.id, invoice_id: invoice5.id, unit_price: 6500, quantity: 5 )}
    let!(:invoice_item6) { create(:invoice_item, id: 6, status: 2, item_id: item6.id, invoice_id: invoice6.id, unit_price: 8400, quantity: 9 )}
    let!(:invoice_item7) { create(:invoice_item, id: 7, status: 2, item_id: item7.id, invoice_id: invoice7.id, unit_price: 8500, quantity: 11 )}
    let!(:invoice_item8) { create(:invoice_item, id: 8, status: 1, item_id: item2.id, invoice_id: invoice8.id, unit_price: 1453, quantity: 25 )}
  
    let!(:invoice_item9) { create(:invoice_item, id: 9, status: 0, item_id: item3.id, invoice_id: invoice9.id, unit_price: 950, quantity: 100 )}
    let!(:invoice_item10) { create(:invoice_item, id: 10, status: 1, item_id: item3.id, invoice_id: invoice10.id, unit_price: 8342, quantity: 25 )}
    let!(:invoice_item11) { create(:invoice_item, id: 11, status: 1, item_id: item3.id, invoice_id: invoice11.id, unit_price: 990, quantity: 250 )}
    let!(:invoice_item12) { create(:invoice_item, id: 12, status: 2, item_id: item7.id, invoice_id: invoice12.id, unit_price: 9990, quantity: 25 )}
  
    let!(:invoice_item13) { create(:invoice_item, id: 13, status: 2, item_id: item7.id, invoice_id: invoice13.id, unit_price: 4000, quantity: 55 )}
    let!(:invoice_item14) { create(:invoice_item, id: 14, status: 1, item_id: item4.id, invoice_id: invoice14.id, unit_price: 550, quantity: 55)}
  
    let!(:invoice_item15) { create(:invoice_item, id: 15, status: 1, item_id: item5.id, invoice_id: invoice15.id, unit_price: 7500, quantity: 15 )}
    let!(:invoice_item16) { create(:invoice_item, id: 16, status: 2, item_id: item6.id, invoice_id: invoice16.id, unit_price: 100000, quantity: 25 )}
  
    let!(:invoice_item17) { create(:invoice_item, id: 17, status: 2, item_id: item6.id, invoice_id: invoice17.id, unit_price: 2900, quantity: 250 )}
  
    let!(:transaction1) { create(:transaction, id: 1, result: 1, invoice_id: invoice1.id )}
    let!(:transaction2) { create(:transaction, id: 2, result: 1, invoice_id: invoice2.id )}
    let!(:transaction3) { create(:transaction, id: 3, result: 1, invoice_id: invoice3.id )}
    let!(:transaction4) { create(:transaction, id: 4, result: 0, invoice_id: invoice4.id )}
  
    let!(:transaction5) { create(:transaction, id: 5, result: 1, invoice_id: invoice5.id )}
    let!(:transaction6) { create(:transaction, id: 6, result: 1, invoice_id: invoice6.id )}
    let!(:transaction7) { create(:transaction, id: 7, result: 1, invoice_id: invoice7.id )}
    let!(:transaction8) { create(:transaction, id: 8, result: 1, invoice_id: invoice8.id )}
  
    let!(:transaction9) { create(:transaction, id: 9, result: 1, invoice_id: invoice9.id )}
    let!(:transaction10) { create(:transaction, id: 10, result: 0, invoice_id: invoice10.id )}
    let!(:transaction11) { create(:transaction, id: 11, result: 1, invoice_id: invoice11.id )}
    let!(:transaction12) { create(:transaction, id: 12, result: 0, invoice_id: invoice12.id )}
  
    let!(:transaction13) { create(:transaction, id: 13, result: 1, invoice_id: invoice13.id )}
    let!(:transaction14) { create(:transaction, id: 14, result: 1, invoice_id: invoice14.id )}
  
    let!(:transaction15) { create(:transaction, id: 15, result: 1, invoice_id: invoice15.id )}
    let!(:transaction16) { create(:transaction, id: 16, result: 0, invoice_id: invoice16.id )}
  
    let!(:transaction17) { create(:transaction, id: 17, result: 0, invoice_id: invoice17.id )}

    describe "#top_selling_date" do
      it "returns the date of the item's highest revenue day by created_at" do
        expect(item1.top_selling_date).to eq("Friday, May 25, 2012")
      end
    end
  end
end