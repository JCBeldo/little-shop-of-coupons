require 'rails_helper'

RSpec.describe 'Admin/invoices show page', type: :feature do
  let!(:merchant_1) { create(:merchant) }

  let!(:items_m1) { create_list(:item, 5, merchant_id: merchant_1.id) }

  let!(:coupon_1) { create(:coupon, merchant_id: merchant_1.id, name: "10 doll-hairs off", disc_type: 1, status: 1, disc_amount: 10.00 ) }
  let!(:coupon_2) { create(:coupon, merchant_id: merchant_1.id, name: "percent off", disc_type: 0, status: 0 ) }
  let!(:coupon_3) { create(:coupon, merchant_id: merchant_1.id, name: "20 percent off", disc_type: 0, status: 1, disc_amount: 20.00) }

  let!(:customer_1) { create(:customer) }
  let!(:customer_2) { create(:customer) }
  let!(:customer_3) { create(:customer) }
  let!(:customer_4) { create(:customer) }
  let!(:customer_5) { create(:customer) }
  let!(:customer_6) { create(:customer) }
  let!(:customer_7) { create(:customer) }

  static_time_1 = Time.zone.parse('2023-04-13 00:50:37')
  static_time_2 = Time.zone.parse('2023-03-13 00:50:37')
  static_time_3 = Time.zone.parse('2023-02-13 00:50:37')

  let!(:invoice_1) { create(:invoice, customer_id: customer_1.id, created_at: "2012-03-25 09:54:09 UTC", coupon_id: coupon_1.id, status: 2) }
  let!(:invoice_2) { create(:invoice, customer_id: customer_2.id, created_at: "2012-05-25 09:54:09 UTC", coupon_id: coupon_3.id) }
  let!(:invoice_3) { create(:invoice, customer_id: customer_3.id) }
  let!(:invoice_4) { create(:invoice, customer_id: customer_4.id) }
  let!(:invoice_5) { create(:invoice, customer_id: customer_5.id) }
  let!(:invoice_6) { create(:invoice, customer_id: customer_6.id) }
  let!(:invoice_7) { create(:invoice, customer_id: customer_7.id, created_at: static_time_1) }
  let!(:invoice_8) { create(:invoice, customer_id: customer_7.id) }
  let!(:invoice_9) { create(:invoice, customer_id: customer_7.id, created_at: static_time_2) }
  let!(:invoice_10) { create(:invoice, customer_id: customer_7.id, created_at: static_time_3) }

  let!(:invoice_item_1) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[0].id, status: 1 ) }
  let!(:invoice_item_2) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[1].id, status: 1 ) }
  let!(:invoice_item_3) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[2].id, status: 0 ) }
  let!(:invoice_item_4) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[3].id, status: 0 ) }
  let!(:invoice_item_5) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[4].id, status: 2 ) }
  let!(:invoice_item_6) { create(:invoice_item, invoice_id: invoice_8.id, item_id: items_m1[4].id, status: 2 ) }
  let!(:invoice_item_7) { create(:invoice_item, invoice_id: invoice_1.id, item_id: items_m1[3].id, status: 0, unit_price: 6000, quantity: 3 ) } 
  let!(:invoice_item_8) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[4].id, status: 0 ) }
  let!(:invoice_item_9) { create(:invoice_item, invoice_id: invoice_1.id, item_id: items_m1[4].id, status: 1, unit_price: 15000, quantity: 1 ) }  
  let!(:invoice_item_10) { create(:invoice_item, invoice_id: invoice_1.id, item_id: items_m1[2].id, status: 0, unit_price: 299, quantity: 10 ) } 
  let!(:invoice_item_11) { create(:invoice_item, invoice_id: invoice_2.id, item_id: items_m1[2].id, status: 0, unit_price: 600, quantity: 10 ) } 

  let!(:trans_1_s) { create_list(:transaction, 1, result: 1, invoice_id: invoice_1.id) }
  let!(:trans_2_s) { create_list(:transaction, 2, result: 1, invoice_id: invoice_2.id) }
  let!(:trans_3_s) { create_list(:transaction, 3, result: 1, invoice_id: invoice_3.id) }
  let!(:trans_4_s) { create_list(:transaction, 4, result: 1, invoice_id: invoice_4.id) }
  let!(:trans_5_s) { create_list(:transaction, 5, result: 1, invoice_id: invoice_5.id) }
  let!(:trans_6_f) { create_list(:transaction, 6, result: 0, invoice_id: invoice_6.id) }

  describe 'displays attributes of an invoice' do
    it 'should display the id, status, and created_at date of an invoice' do
      visit admin_invoice_path(invoice_7)
      
      expect(page).to have_content(invoice_7.id)
      expect(page).to have_content(invoice_7.status)
      expect(page).to have_content(invoice_7.format_time_stamp)
    end
    
    it 'should display the customer first and last name of an invoice' do
      visit admin_invoice_path(invoice_1)
      
      expect(page).to have_content(customer_1.first_name)
      expect(page).to have_content(customer_1.last_name)
      expect(customer_1.first_name).to appear_before(customer_1.last_name)
      expect(page).to_not have_content(customer_2.first_name)
      expect(page).to_not have_content(customer_2.last_name)
    end

    it 'should display total revenue of all items on this invoice' do
      visit admin_invoice_path(invoice_1)
      
      expect(page).to have_content("Subtotal: $359.90")
    end
  end

  describe 'displays a section for items on this invoice with attributes' do
    it 'should display the attributes of items on this invoice in a table' do
      visit admin_invoice_path(invoice_1)
      
      expect(page).to have_content("Items on this Invoice:")
      expect(page).to have_content(items_m1[2].name)
      expect(page).to have_content(items_m1[3].name)
      expect(page).to have_content(items_m1[4].name)
      expect(page).to have_content(invoice_item_7.quantity)
      expect(page).to have_content(invoice_item_9.quantity)
      expect(page).to have_content(invoice_item_10.quantity)
      expect(page).to have_content(invoice_item_7.cents_to_dollar)
      expect(page).to have_content(invoice_item_9.cents_to_dollar)
      expect(page).to have_content(invoice_item_10.cents_to_dollar)
      expect(page).to have_content(invoice_item_7.status)
      expect(page).to have_content(invoice_item_9.status)
      expect(page).to have_content(invoice_item_10.status)
    end
  end

  describe 'displays a selector for the status that allows for updating the status' do
    it 'should display a drop down selector to update invoice status' do
      visit admin_invoice_path(invoice_1)
      
      within("#status-selector") do
        expect(page).to have_button("Update Invoice")
        expect(page).to have_content("completed")
      
        select('cancelled', from: "Status")
        click_button("Update Invoice")

        expect(page).to have_content("cancelled")
      end
    end
  end

  describe 'displays a subtotal and a grand total with discounts and coupons used' do
    it 'should display a refactored subtotal section and a new grand total section for dollar off' do
      visit admin_invoice_path(invoice_1)
      
      expect(page).to have_content("Subtotal: $359.90")
      expect(page).to have_content("Grand Total: $349.90")
    end
    
    it 'should display a refactored subtotal section and a new grand total section for percent off' do
      visit admin_invoice_path(invoice_2)
      
      expect(page).to have_content("Subtotal: $60.00")
      expect(page).to have_content("Grand Total: $48.00")
    end

    it 'should display the coupon name and code of coupon used' do
      visit admin_invoice_path(invoice_1)
      
      expect(page).to have_content(coupon_1.name)
      expect(page).to have_content(coupon_1.unique_code)
    end
  end
end