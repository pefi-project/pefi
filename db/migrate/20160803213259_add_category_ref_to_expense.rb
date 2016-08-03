class AddCategoryRefToExpense < ActiveRecord::Migration[5.0]
  def change
    add_reference :expenses, :category, index: true
  end
end
