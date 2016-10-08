class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.belongs_to :market, index: true
      t.integer :ref_id
      t.string :name
      t.integer :num_employees
      t.integer :ref_id_market

      t.timestamps null: false
    end
  end
end
