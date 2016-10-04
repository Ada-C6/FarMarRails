class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :amount
      t.datetime :purchase_time
      t.belongs_to :product
      t.belongs_to :vendor

      t.timestamps null: false
    end
  end
end
