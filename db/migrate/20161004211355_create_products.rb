class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.belongs_to :vendor

      t.timestamps null: false
    end
  end
end
