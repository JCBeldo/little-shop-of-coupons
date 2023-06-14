class Invoice < ApplicationRecord
  self.primary_key = :id
  belongs_to :customer, optional: false
  belongs_to :coupon, optional: true
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions
  has_many :merchants, through: :items
  
  enum :status, ["cancelled", "in progress", "completed"]

  def self.sorted_incomplete_invoices
    Invoice.joins(:invoice_items)
    .where("invoice_items.status !=?", 2)
    .group(:id)
    .order(:created_at)
  end

  def total_revenue
    invoice_items.sum("invoice_items.quantity * invoice_items.unit_price")/100.00
  end

  def customer_full_name
    "#{customer.first_name} #{customer.last_name}"
  end

  def grand_total
    return 0 if (total_revenue * percent_coupon_discount/100) >= total_revenue || dollar_coupon_discount >= total_revenue
      if self.coupon.disc_type == "percent off"
      total_revenue - (total_revenue * percent_coupon_discount/100)
      else self.coupon.disc_type == "dollar off"
        total_revenue - dollar_coupon_discount
      end
  end

  def dollar_coupon_discount
    Coupon.joins(:invoices)
    .where("coupons.status = 1 AND coupons.disc_type = 1")
    .select("coupons.*")
    .pluck(:disc_amount)
    .to_sentence
    .to_i
  end

  def percent_coupon_discount
    Coupon.joins(:invoices)
    .select("coupons.*")
    .where("coupons.status = 1 AND coupons.disc_type = 0")
    .pluck(:disc_amount)
    .to_sentence
    .to_i
  end
end
