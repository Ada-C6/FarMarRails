class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.integer :num_employees
      t.belongs_to :market

      t.timestamps null: false
    end
  end
end
