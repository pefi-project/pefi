class Expense < ApplicationRecord
  monetize :price_cents

  belongs_to :category

  validates :name, presence: true
  validates :date, presence: true
  validates :price_cents, presence: true, numericality: { greater_than: 0 }

  def description
    "#{name} (#{price})"
  end
end
