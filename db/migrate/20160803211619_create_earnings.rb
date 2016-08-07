class CreateEarnings < ActiveRecord::Migration[5.0]
  def change
    create_table :earnings do |t|
      t.string :name
      t.datetime :date
      t.monetize :amount

      t.timestamps
    end
  end
end
