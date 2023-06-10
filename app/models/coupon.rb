class Coupon < ApplicationRecord
  belongs_to :merchant
  has_many :invoices

  enum :status, ["inactive", "active"]
  enum :disc_type, ["percent_off", "dollar_off"]
end