class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.integer :no_employees
      t.integer :market_id
      t.references :market, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
