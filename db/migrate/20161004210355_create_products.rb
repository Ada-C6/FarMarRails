class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.belongs_to :vendor, index: true
      t.integer :ref_id
      t.string :name
      t.integer :ref_id_vendor

      t.timestamps null: false
    end
  end
end
