class Expense < ApplicationRecord
  attr_accessor :name, :date

  monetize :price_cents

  validates_presence_of :name, :date, :price_cents
  validates :price_cents, numericality: { greater_than: 0 }

  belongs_to :category
end
