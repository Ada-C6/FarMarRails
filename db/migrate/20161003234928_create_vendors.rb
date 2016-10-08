class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors, id: false do |t|
      t.primary_key :id
      t.string :name
      t.integer :number_employees
      t.belongs_to :market, index: true

      t.timestamps null: false
    end
  end
end
