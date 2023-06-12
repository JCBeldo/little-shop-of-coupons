require "rails_helper"

RSpec.describe "Merchant/coupons Index Page", type: :feature do
  let!(:merchant_1) { create(:merchant) }
  let!(:merchant_2) { create(:merchant) }

  let!(:coupon_1) { create(:coupon, merchant_id: merchant_1.id, status: 1 ) }
  let!(:coupon_2) { create(:coupon, merchant_id: merchant_1.id, status: 1 ) }
  let!(:coupon_3) { create(:coupon, merchant_id: merchant_1.id, status: 0 ) }
  let!(:coupon_4) { create(:coupon, merchant_id: merchant_1.id, status: 0 ) }
  let!(:coupon_5) { create(:coupon, merchant_id: merchant_2.id, status: 0 ) }

  describe 'Displays all coupons belonging to this merchant' do
    it 'should display the coupon names and amount off' do
      visit merchant_coupons_path(merchant_1)

      expect(page).to have_content(coupon_1.name)
      expect(page).to have_content(coupon_1.disc_amount.to_i)
      expect(page).to have_content(coupon_2.name)
      expect(page).to have_content(coupon_2.disc_amount.to_i)
      expect(page).to have_content(coupon_3.name)
      expect(page).to have_content(coupon_3.disc_amount.to_i)
      expect(page).to_not have_content(coupon_5.name)
      expect(page).to_not have_content(coupon_5.disc_amount)
    end
    
    it 'should display the coupon names as links' do
      visit merchant_coupons_path(merchant_1)
      
      expect(page).to have_link("#{coupon_1.name}")
      expect(page).to have_link("#{coupon_2.name}")
      expect(page).to have_link("#{coupon_3.name}")
      expect(page).to_not have_link("#{coupon_5.name}")

      click_link("#{coupon_1.name}", :href => merchant_coupon_path(merchant_1, coupon_1))
    end

    it 'should display a link to create a new coupon' do
      visit merchant_coupons_path(merchant_1)
      
      expect(page).to have_link("Create Coupon")

      click_link("Create Coupon")

      expect(current_path).to eq(new_merchant_coupon_path(merchant_1))
    end
  end

  describe 'displays active and inactive coupons in two seperate sections' do
    it 'should display two sections for inactive and active coupons' do
      visit merchant_coupons_path(merchant_1)
  
      within("#active-coupons") do
        expect(page).to have_content("Active Coupons")
        expect(page).to have_content(coupon_1.name)
        expect(page).to have_content(coupon_2.name)
        expect(page).to_not have_content(coupon_3.name)
        expect(page).to_not have_content(coupon_4.name)
        expect(page).to_not have_content(coupon_5.name)
      end

      within("#inactive-coupons") do
        expect(page).to have_content("Inactive Coupons")
        expect(page).to have_content(coupon_3.name)
        expect(page).to have_content(coupon_4.name)
        expect(page).to_not have_content(coupon_1.name)
        expect(page).to_not have_content(coupon_2.name)
        expect(page).to_not have_content(coupon_5.name)
      end
    end
  end
end
