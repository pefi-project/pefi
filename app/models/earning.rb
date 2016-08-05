class Earning < ApplicationRecord
  monetize :amount_cents

  validates :name, presence: true
  validates :date, presence: true
  validates :amount_cents, presence: true, numericality: { greater_than: 0 }
end
