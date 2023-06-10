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
end
