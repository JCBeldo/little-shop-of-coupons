require "rails_helper"

RSpec.describe "Merchant/coupons Index Page", type: :feature do
  let!(:merchant_1) { create(:merchant) }
  let!(:merchant_2) { create(:merchant) }
  
  let!(:coupon_1) { create(:coupon, merchant_id: merchant_1.id, name: "10 doll-hairs off", disc_type: 1, status: 1 ) }
  let!(:coupon_2) { create(:coupon, merchant_id: merchant_1.id, name: "percent off", disc_type: 0, status: 0 ) }
  let!(:coupon_3) { create(:coupon, merchant_id: merchant_1.id ) }
  let!(:coupon_4) { create(:coupon, merchant_id: merchant_2.id ) }
  
  let!(:customer_1) { create(:customer) }
  let!(:invoice_1) { create(:invoice, customer_id: customer_1.id, status: 2, coupon_id: coupon_1.id) }
  
  let!(:trans_1_s) { create(:transaction, result: 1, invoice_id: invoice_1.id) }
  let!(:trans_2_s) { create(:transaction, result: 1, invoice_id: invoice_1.id) }
  let!(:trans_2_f) { create(:transaction, result: 0, invoice_id: invoice_1.id) }
  
  describe "Displays a coupons' attributes" do
    # before :each do
    # @merchant_1 = create(:merchant)
    # @merchant_2 = create(:merchant)
  
    # @coupon_1 = create(:coupon, merchant_id: @merchant_1.id, name: "10 doll-hairs off", disc_type: 1, status: 1 )
    # @coupon_2 = create(:coupon, merchant_id: @merchant_1.id, name: "percent off", disc_type: 0 )
    # @coupon_3 = create(:coupon, merchant_id: @merchant_1.id )
    # @coupon_4 = create(:coupon, merchant_id: @merchant_2.id )
    
    # @customer_1 = create(:customer)
    # @invoice_1 = create(:invoice, customer_id: @customer_1.id, status: 2, coupon_id: @coupon_1.id)
    
    # @trans_1_s = create(:transaction, result: 1, invoice_id: @invoice_1.id)
    # @trans_2_s = create(:transaction, result: 1, invoice_id: @invoice_1.id)
    # @trans_2_f = create(:transaction, result: 0, invoice_id: @invoice_1.id)
    # end

    it 'should display a coupons name, unique code, status, and discount amount' do
      visit merchant_coupon_path(merchant_1, coupon_1)
      
      expect(page).to have_content(coupon_1.name)
      expect(page).to have_content(coupon_1.unique_code)
      expect(page).to have_content(coupon_1.disc_amount.to_i)
      expect(page).to have_content(coupon_1.status)
      
      visit merchant_coupon_path(merchant_1, coupon_2)
      
      expect(page).to have_content(coupon_2.name)
      expect(page).to have_content(coupon_2.unique_code)
      expect(page).to have_content(coupon_2.disc_amount.to_i)
      expect(page).to have_content(coupon_2.status)
    end
    
    it 'should display a coupons usage count' do
      visit merchant_coupon_path(merchant_1, coupon_1)
      
      expect(page).to have_content("Times Used: 2")
      expect(page).to_not have_content("Times Used: 3")
    end
  end

  describe 'Displays a button to ddeactive an active coupon' do
    it 'should display a button to deactivate a coupon' do
      visit merchant_coupon_path(merchant_1, coupon_1)
      
      expect(page).to have_button("Deactivate")
      expect(page).to_not have_button("Activate")
      expect(coupon_1.status).to eq("Active")
      
      click_button("Deactivate")
      
      expect(current_path).to eq(merchant_coupon_path(merchant_1, coupon_1))
      coupon_1.reload
      expect(coupon_1.status).to_not eq("Active")
      expect(page).to_not have_button("Deactivate")
    end
    
    it 'should display a button to activate a coupon' do
      visit merchant_coupon_path(merchant_1, coupon_2)
      
      expect(page).to have_button("Activate")
      expect(page).to_not have_button("Deactivate")
      expect(coupon_2.status).to eq("Inactive")
      
      click_button("Activate")
      
      expect(current_path).to eq(merchant_coupon_path(merchant_1, coupon_2))
      coupon_2.reload
      expect(coupon_2.status).to_not eq("Inactive")
      expect(page).to_not have_button("Activate")
    end
  end
end