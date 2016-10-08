class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products, id: false do |t|
      t.primary_key :id
      t.string :name
      t.belongs_to :vendor, index: true

      t.timestamps null: false
    end
  end
end
