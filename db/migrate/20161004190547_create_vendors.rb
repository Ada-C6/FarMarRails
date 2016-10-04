class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.belongs_to :market
      
      t.string :name
      t.integer :num_employees
      t.integer :market_id

      t.timestamps null: false
    end
  end
end
