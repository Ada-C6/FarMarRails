class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.fixnum :id
      t.string :name
      t.fixnum :employee_num
      t.fixnum :market_id

      t.timestamps null: false
    end
  end
end
