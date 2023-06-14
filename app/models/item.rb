class Item < ApplicationRecord
  self.primary_key = :id
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  enum :status, [:disabled, :enabled]

  def top_selling_date
    invoice = Item.joins(invoices: :transactions)
    .where('transactions.result = ? and invoice_items.item_id = ?', "1", self.id)
    .select("invoices.*, SUM(invoice_items.unit_price * invoice_items.quantity) as total_revenue")
    .group("invoices.id")
    .order(total_revenue: :desc)
    .limit(1)
    .first
    invoice.format_time_stamp
  end
end