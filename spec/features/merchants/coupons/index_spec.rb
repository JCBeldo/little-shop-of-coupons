require "rails_helper"

RSpec.describe "Merchant/coupons Index Page", type: :feature do
  let!(:merchant_1) { create(:merchant) }
  let!(:merchant_2) { create(:merchant) }

  let!(:coupon_1) { create(:coupon, merchant_id: merchant_1.id ) }
  let!(:coupon_2) { create(:coupon, merchant_id: merchant_1.id ) }
  let!(:coupon_3) { create(:coupon, merchant_id: merchant_1.id ) }
  let!(:coupon_4) { create(:coupon, merchant_id: merchant_2.id ) }

  describe 'Displays all coupons belonging to this merchant' do
    it 'should display the coupon names and amount off' do
      visit merchant_coupons_path(merchant_1)

      expect(page).to have_content(coupon_1.name)
      expect(page).to have_content(coupon_1.disc_amount)
      expect(page).to have_content(coupon_2.name)
      expect(page).to have_content(coupon_2.disc_amount)
      expect(page).to have_content(coupon_3.name)
      expect(page).to have_content(coupon_3.disc_amount)
      expect(page).to_not have_content(coupon_4.name)
      expect(page).to_not have_content(coupon_4.disc_amount)
    end
    
    it 'should display the coupon names as links' do
      visit merchant_coupons_path(merchant_1)
      
      expect(page).to have_link("#{coupon_1.name}")
      expect(page).to have_link("#{coupon_2.name}")
      expect(page).to have_link("#{coupon_3.name}")
      expect(page).to_not have_link("#{coupon_4.name}")

      click_link("#{coupon_1.name}", :href => merchant_coupon_path(merchant_1, coupon_1))
    end

    it 'should display a link to create a new coupon' do
      visit merchant_coupons_path(merchant_1)
      
      expect(page).to have_link("Create Coupon")

      click_link("Create Coupon")

      expect(current_path).to eq(new_merchant_coupon_path(merchant_1))
    end
  end
end