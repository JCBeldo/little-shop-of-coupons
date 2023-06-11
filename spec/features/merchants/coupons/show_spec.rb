require "rails_helper"

RSpec.describe "Merchant/coupons Index Page", type: :feature do
  let!(:merchant_1) { create(:merchant) }
  let!(:merchant_2) { create(:merchant) }

  let!(:coupon_1) { create(:coupon, merchant_id: merchant_1.id, name: "10 doll-hairs off", disc_type: 1 ) }
  let!(:coupon_2) { create(:coupon, merchant_id: merchant_1.id, name: "percent off", disc_type: 0 ) }
  let!(:coupon_3) { create(:coupon, merchant_id: merchant_1.id ) }
  let!(:coupon_4) { create(:coupon, merchant_id: merchant_2.id ) }

  let!(:customer_1) { create(:customer) }
  let!(:invoice_1) { create(:invoice, customer_id: customer_1.id, status: 2, coupon_id: coupon_1.id) }
  let!(:trans_1_s) { create(:transaction, result: 1, invoice_id: invoice_1.id) }
  let!(:trans_2_s) { create(:transaction, result: 1, invoice_id: invoice_1.id) }

  describe 'Displays a coupons attributes' do
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
      save_and_open_page
      expect(page).to have_content("Times Used: 2")
    end
  end
end

# As a merchant
# When I visit a merchant's coupon show page
# I see that coupon's name and code
# And I see the percent/dollar off value
# As well as its status (active or inactive)
# And I see a count of how many times that coupon has been used.

# (Note: "use" of a coupon should be limited to successful transactions.)