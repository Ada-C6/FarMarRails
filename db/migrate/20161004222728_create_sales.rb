class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :amount
      t.datetime :purchase_time
      t.references :vendor, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
