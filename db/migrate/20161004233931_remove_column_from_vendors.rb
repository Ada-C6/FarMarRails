class RemoveColumnFromVendors < ActiveRecord::Migration
  def change
    remove_column :vendors, :vendor_id, :integer
  end
end
