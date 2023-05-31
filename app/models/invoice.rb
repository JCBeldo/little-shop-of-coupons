class Invoice < ApplicationRecord
  self.primary_key = :id
  has_many :invoice_items
  has_many :items, through: :invoice_items
  belongs_to :customer
  has_many :transactions
  enum :status, [:cancelled, "In Progress", :completed]
end