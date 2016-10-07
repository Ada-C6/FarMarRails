class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.belongs_to :product, index: true
      t.belongs_to :vendor, index: true
      t.string :name
      t.datetime :purchase_time

      t.timestamps null: false
    end
  end
end
