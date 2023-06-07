require "rails_helper"

RSpec.describe Invoice, type: :model do
  let!(:merchant_1) { create(:merchant) }

  let!(:items_m1) { create_list(:item, 5, merchant_id: merchant_1.id) }

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

  let!(:invoice_1) { create(:invoice, customer_id: customer_1.id) }
  let!(:invoice_2) { create(:invoice, customer_id: customer_2.id) }
  let!(:invoice_3) { create(:invoice, customer_id: customer_3.id) }
  let!(:invoice_4) { create(:invoice, customer_id: customer_4.id) }
  let!(:invoice_5) { create(:invoice, customer_id: customer_5.id) }
  let!(:invoice_6) { create(:invoice, customer_id: customer_6.id) }
  let!(:invoice_7) { create(:invoice, customer_id: customer_7.id, created_at: static_time_1) }
  let!(:invoice_8) { create(:invoice, customer_id: customer_7.id) }
  let!(:invoice_9) { create(:invoice, customer_id: customer_7.id, created_at: static_time_2) }
  let!(:invoice_10) { create(:invoice, customer_id: customer_7.id, created_at: static_time_3) }

  let!(:invoice_item_1) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[0].id, status: 1, quantity: 10, unit_price: 5000 ) }
  let!(:invoice_item_2) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[1].id, status: 1, quantity: 10, unit_price: 5000 ) }
  let!(:invoice_item_3) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[2].id, status: 0, quantity: 10, unit_price: 5000 ) }
  let!(:invoice_item_4) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[3].id, status: 0, quantity: 10, unit_price: 5000 ) }
  let!(:invoice_item_5) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[4].id, status: 2, quantity: 10, unit_price: 5000 ) }
  let!(:invoice_item_6) { create(:invoice_item, invoice_id: invoice_8.id, item_id: items_m1[4].id, status: 2 ) }
  let!(:invoice_item_7) { create(:invoice_item, invoice_id: invoice_9.id, item_id: items_m1[3].id, status: 0, quantity: 10, unit_price: 5000 ) }
  let!(:invoice_item_8) { create(:invoice_item, invoice_id: invoice_7.id, item_id: items_m1[4].id, status: 0, quantity: 10, unit_price: 5000 ) }
  let!(:invoice_item_9) { create(:invoice_item, invoice_id: invoice_9.id, item_id: items_m1[4].id, status: 0, quantity: 1, unit_price: 49999 ) }
  let!(:invoice_item_10) { create(:invoice_item, invoice_id: invoice_10.id, item_id: items_m1[4].id, status: 0 ) }

  let!(:trans_1_s) { create_list(:transaction, 1, result: 1, invoice_id: invoice_1.id) }
  let!(:trans_2_s) { create_list(:transaction, 2, result: 1, invoice_id: invoice_2.id) }
  let!(:trans_3_s) { create_list(:transaction, 3, result: 1, invoice_id: invoice_3.id) }
  let!(:trans_4_s) { create_list(:transaction, 4, result: 1, invoice_id: invoice_4.id) }
  let!(:trans_5_s) { create_list(:transaction, 5, result: 1, invoice_id: invoice_5.id) }
  let!(:trans_6_f) { create_list(:transaction, 6, result: 0, invoice_id: invoice_6.id) }

  describe "relationships" do
    it { should have_many(:invoice_items) }
    it { should have_many(:items).through(:invoice_items) }
    it { should belong_to(:customer) }
    it { should have_many(:transactions) }
    it { should have_many(:merchants) }
  end

  describe "class methods" do
    context "::sorted_incomplete_invoices" do
      it "returns all incomplete invoices grouped by invoice sorted oldest to newest" do
        expect(Invoice.sorted_incomplete_invoices).to eq([invoice_10, invoice_9, invoice_7])
      end
    end
  end
  
  describe "instance methods" do
    context "#total_revenue" do
      it "returns the total revenue of items on an invoice" do
        expect(invoice_9.total_revenue).to eq(999.99)
        expect(invoice_7.total_revenue).to eq(3000.00)
      end
    end
  end
end