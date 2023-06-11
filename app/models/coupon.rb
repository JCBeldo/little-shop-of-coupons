class Coupon < ApplicationRecord
  belongs_to :merchant
  has_many :invoices
  has_many :transactions, through: :invoices
  validates :unique_code, uniqueness: true

  enum :status, ["Inactive", "Active"]
  enum :disc_type, ["percent off", "dollar off"]

  def times_used
    Coupon.joins(:transactions)
    .where("transactions.result = 1")
    .count
  end
end