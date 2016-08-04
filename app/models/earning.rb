class Earning < ApplicationRecord
  attr_accessor :name
  attr_accessor :date

  monetize :amount_cents

  validates_presence_of :date, :amount_cents
  validates :amount_cents, numericality: { greater_than: 0 }
end
