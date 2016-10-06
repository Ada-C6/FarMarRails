class RenameColumns < ActiveRecord::Migration
  def change
    rename_column :market_vendor_cleans, :markets_id, :market_id
    rename_column :market_vendor_cleans, :vendors_id, :vendor_id
  end
end
