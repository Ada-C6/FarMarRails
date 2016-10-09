class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products, id: false do |t|
      t.belongs_to :vendor

      t.primary_key :id
      t.string :name
      t.integer :vendor_id

      t.timestamps null: false
    end
  end
end
