class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors, id: false do |t|
      t.belongs_to :market

      t.primary_key :id
      t.string :name
      t.integer :num_employees
      t.integer :market_id

      t.timestamps null: false
    end
  end
end
