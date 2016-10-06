class CreateMarketVendorCleans < ActiveRecord::Migration
  def change
    create_table :market_vendor_cleans do |t|
      t.references :markets, index: true, foreign_key: true
      t.references :vendors, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
