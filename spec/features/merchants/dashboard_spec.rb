require "rails_helper"

RSpec.describe "Merchant Dashboard" do
  let!(:merchant) { create(:merchant, id: 1, name:"Dealer of Death", status: 1 )}
  let!(:merchant2) { create(:merchant, id: 2, name:"Dealer of Life", status: 1 )}

  let!(:item1) { create(:item, id: 1, merchant_id: 1 )}
  let!(:item2) { create(:item, id: 2, merchant_id: 1 )}
  let!(:item3) { create(:item, id: 3, merchant_id: 1 )}
  let!(:item4) { create(:item, id: 4, merchant_id: 1 )}
  let!(:item5) { create(:item, id: 5, merchant_id: 1 )}
  let!(:item6) { create(:item, id: 6, merchant_id: 1 )}
  let!(:item7) { create(:item, id: 7, merchant_id: 1 )}

  let!(:item8) { create(:item, id: 8, merchant_id: 2 )}
  let!(:item9) { create(:item, id: 9, merchant_id: 2 )}

  let!(:customer1) { create(:customer, id: 1, last_name: "Dean", first_name: "Austin" )}
  let!(:customer2) { create(:customer, id: 2, last_name: "Dean", first_name: "Jimmy" )}
  let!(:customer3) { create(:customer, id: 3, last_name: "Dean", first_name: "Garrett" )}
  let!(:customer4) { create(:customer, id: 4, last_name: "Dean", first_name: "Julian" )}
  let!(:customer5) { create(:customer, id: 5, last_name: "Dean", first_name: "James" )}
  let!(:customer6) { create(:customer, id: 6, last_name: "Dean", first_name: "John" )}
  let!(:customer7) { create(:customer, id: 7, last_name: "Dean", first_name: "Jerry" )}

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

  let!(:invoice_item1) { create(:invoice_item, id: 1, status: 0,  item_id: item1.id, invoice_id: invoice1.id )}
  let!(:invoice_item2) { create(:invoice_item, id: 2, status: 1, item_id: item1.id, invoice_id: invoice2.id )}
  let!(:invoice_item3) { create(:invoice_item, id: 3, status: 1, item_id: item1.id, invoice_id: invoice3.id )}
  let!(:invoice_item4) { create(:invoice_item, id: 4, status: 2, item_id: item6.id, invoice_id: invoice4.id )}

  let!(:invoice_item5) { create(:invoice_item, id: 5, status: 0, item_id: item2.id, invoice_id: invoice5.id )}
  let!(:invoice_item6) { create(:invoice_item, id: 6, status: 2, item_id: item6.id, invoice_id: invoice6.id )}
  let!(:invoice_item7) { create(:invoice_item, id: 7, status: 2, item_id: item7.id, invoice_id: invoice7.id )}
  let!(:invoice_item8) { create(:invoice_item, id: 8, status: 1, item_id: item2.id, invoice_id: invoice8.id )}

  let!(:invoice_item9) { create(:invoice_item, id: 9, status: 0, item_id: item3.id, invoice_id: invoice9.id )}
  let!(:invoice_item10) { create(:invoice_item, id: 10, status: 1, item_id: item3.id, invoice_id: invoice10.id )}
  let!(:invoice_item11) { create(:invoice_item, id: 11, status: 1, item_id: item3.id, invoice_id: invoice11.id )}
  let!(:invoice_item12) { create(:invoice_item, id: 12, status: 2, item_id: item7.id, invoice_id: invoice12.id )}

  let!(:invoice_item13) { create(:invoice_item, id: 13, status: 2, item_id: item7.id, invoice_id: invoice13.id )}
  let!(:invoice_item14) { create(:invoice_item, id: 14, status: 1, item_id: item4.id, invoice_id: invoice14.id)}

  let!(:invoice_item15) { create(:invoice_item, id: 15, status: 1, item_id: item5.id, invoice_id: invoice15.id )}
  let!(:invoice_item16) { create(:invoice_item, id: 16, status: 2, item_id: item6.id, invoice_id: invoice16.id )}

  let!(:invoice_item17) { create(:invoice_item, id: 17, status: 2, item_id: item6.id, invoice_id: invoice17.id )}

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
  describe "It shows the merchant dashboard" do

    it "shows the name of the merchant in the merchant dashboard" do
      visit "/merchants/#{merchant.id}/dashboard"

      expect(page).to have_content("Dealer of Death")
    end

    it "has links to invoices index" do
      visit "/merchants/#{merchant.id}/dashboard"

      expect(page).to have_link("My Invoices")
      expect(page).to have_link("My Items")
    end

    it "has names of the top 5 customers" do
      visit "/merchants/#{merchant.id}/dashboard"

      expect(page).to have_content("Favorite Customers")
      expect(customer2.first_name).to appear_before(customer1.first_name)
      expect(customer1.first_name).to appear_before(customer3.first_name)
      expect(customer3.first_name).to appear_before(customer4.first_name)
      expect(customer4.first_name).to appear_before(customer5.first_name)
    end

    it "displays the number of successful transactions next to customer's name" do
      visit "/merchants/#{merchant.id}/dashboard"
      
      expect(page).to have_content("Jimmy Dean")
      expect(page).to have_content("Austin Dean")
      expect(page).to have_content("Garrett Dean")
      expect(page).to have_content("Julian Dean")
      expect(page).to have_content("James Dean")
    end

    it "displays items ready to ship with names of all items that have been ordered and not yet shipped" do
      visit "/merchants/#{merchant.id}/dashboard"

      expect(page).to have_content("Items Ready to Ship")

      expect(page).to have_content(invoice_item1.item.name)
      expect(page).to have_content(invoice_item2.item.name)
      expect(page).to have_content(invoice_item3.item.name)
      expect(page).to have_content(invoice_item5.item.name)
      expect(page).to have_content(invoice_item8.item.name)
      expect(page).to have_content(invoice_item9.item.name)
      expect(page).to have_content(invoice_item10.item.name)
      expect(page).to have_content(invoice_item11.item.name)
      expect(page).to have_content(invoice_item14.item.name)
      expect(page).to have_content(invoice_item15.item.name)

      expect(page).to_not have_content(invoice_item4.item.name)
      expect(page).to_not have_content(invoice_item6.item.name)
      expect(page).to_not have_content(invoice_item7.item.name)
      expect(page).to_not have_content(invoice_item12.item.name)
      expect(page).to_not have_content(invoice_item16.item.name)

      expect(page).to have_content("#{item1.invoice_items.first.invoice.id}")
      expect(page).to have_content("#{item2.invoice_items.first.invoice.id}")
      expect(page).to have_content("#{item3.invoice_items.first.invoice.id}")
      expect(page).to have_content("#{item5.invoice_items.first.invoice.id}")
    end

    it "displays Invoices sorted by least recent with date next to ID " do
      visit "/merchants/#{merchant.id}/dashboard"

      expect("Wednesday, January 25, 2012").to appear_before("Sunday, March 25, 2012")
      expect("Sunday, March 25, 2012").to appear_before("Wednesday, April 25, 2012")
      expect("Wednesday, April 25, 2012").to appear_before("Friday, May 25, 2012")
      expect("Friday, May 25, 2012").to appear_before("Wednesday, June 20, 2012")
      expect("Wednesday, June 20, 2012").to appear_before("Wednesday, July 25, 2012")
      expect("Wednesday, July 25, 2012").to appear_before("Saturday, August 25, 2012")
      expect("Saturday, August 25, 2012").to appear_before("Sunday, November 25, 2012")
      expect("Sunday, November 25, 2012").to appear_before("Monday, March 25, 2013")
      expect("Monday, March 25, 2013").to appear_before("Wednesday, December 25, 2013")
    end
  end

  describe 'displays a link to the merchant coupons index page' do
    it 'should display a link to the merchant coupons index' do
      visit "/merchants/#{merchant.id}/dashboard"
      
      expect(page).to have_link("My Coupons")

      click_link("My Coupons")

      expect(current_path).to eq(merchant_coupons_path(merchant))
    end
  end
end
