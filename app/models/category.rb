# Manage expense categorization.
class Category < ApplicationRecord
  validates :name, presence: true

  belongs_to :user

  has_many :subcategories, class_name: 'Category',
                           foreign_key: 'parent_category_id'
  belongs_to :parent_category, class_name: 'Category', optional: true

  has_many :expenses

  def description
    name
  end
end
