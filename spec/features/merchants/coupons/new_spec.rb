require "rails_helper"

RSpec.describe "Merchant/coupons Index Page", type: :feature do
  let!(:merchant_1) { create(:merchant) }
  let!(:merchant_2) { create(:merchant) }

  let!(:coupon_1) { create(:coupon, merchant_id: merchant_1.id ) }
  let!(:coupon_2) { create(:coupon, merchant_id: merchant_1.id ) }
  let!(:coupon_3) { create(:coupon, merchant_id: merchant_1.id ) }
  let!(:coupon_4) { create(:coupon, merchant_id: merchant_2.id ) }

  describe 'displays a form to create a new coupon' do
    it 'should display a form with fields for name, unique_code, amount, and type of discount' do
      visit new_merchant_coupon_path(merchant_1)
      
      expect(page).to have_content("Make a New Coupon")
      expect(page).to_not have_content("$10 OFF")
      expect(page).to have_button("Make Coupon")
      
      fill_in(:name, with: "$10 OFF")
      fill_in(:unique_code, with: "10SUMMER")
      select("dollar off", from: :disc_type)
      fill_in(:disc_amount, with: "10")
      click_button("Make Coupon")

      expect(current_path).to eq(merchant_coupons_path(merchant_1))
      
      expect(page).to have_content("$10 OFF")
      expect(page).to_not have_content(coupon_4.name)
    end
    
    #sad path, code not unique

    it 'should display an error message for non unique code' do 
      coupon_5 = create(:coupon, merchant_id: merchant_1.id, unique_code: "10SUMMER" )

      visit new_merchant_coupon_path(merchant_2)
      
      fill_in(:name, with: "$10 OFF")
      fill_in(:unique_code, with: "10SUMMER")
      select("dollar off", from: :disc_type)
      fill_in(:disc_amount, with: "10")
      click_button("Make Coupon")

      expect(current_path).to eq(new_merchant_coupon_path(merchant_2))
      
      expect(page).to have_content("ERROR: Code Not Unique")
    end
  end
end