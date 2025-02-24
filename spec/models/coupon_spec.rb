require "rails_helper"

RSpec.describe Coupon, type: :model do
  let!(:merchant_1) { create(:merchant) }
  let!(:merchant_2) { create(:merchant) }

  let!(:coupon_1) { create(:coupon, merchant_id: merchant_1.id ) }
  let!(:coupon_2) { create(:coupon, merchant_id: merchant_1.id ) }
  let!(:coupon_3) { create(:coupon, merchant_id: merchant_1.id ) }
  let!(:coupon_4) { create(:coupon, merchant_id: merchant_2.id ) }

  let!(:customer_1) { create(:customer) }
  let!(:invoice_1) { create(:invoice, customer_id: customer_1.id, status: 2, coupon_id: coupon_1.id) }
  
  let!(:trans_1_s) { create(:transaction, result: 1, invoice_id: invoice_1.id) }
  let!(:trans_2_s) { create(:transaction, result: 1, invoice_id: invoice_1.id) }
  let!(:trans_2_f) { create(:transaction, result: 0, invoice_id: invoice_1.id) }

  describe "relationships" do
    it { should belong_to(:merchant) }
    it { should have_many(:invoices) }
  end

  describe "validations" do
    it { should validate_uniqueness_of(:unique_code) }
  end

  describe "instance methods" do
    it '#times_used' do
      expect(coupon_1.times_used).to eq(2)
      expect(coupon_2.times_used).to eq(0)
    end
  end
end
