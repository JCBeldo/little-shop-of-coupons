require "rails_helper"

RSpec.describe Coupon, type: :model do
  let!(:merchant_1) { create(:merchant) }
  let!(:merchant_2) { create(:merchant) }

  let!(:coupon_1) { create(:coupon, merchant_id: merchant_1.id ) }
  let!(:coupon_2) { create(:coupon, merchant_id: merchant_1.id ) }
  let!(:coupon_3) { create(:coupon, merchant_id: merchant_1.id ) }
  let!(:coupon_4) { create(:coupon, merchant_id: merchant_2.id ) }
  
  describe "relationships" do
    it { should belong_to(:merchant) }
    it { should have_many(:invoices) }
  end

  describe "validations" do
    it { should validate_uniqueness_of(:unique_code) }
  end
end
