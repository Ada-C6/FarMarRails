class RemoveColumnFromSales < ActiveRecord::Migration
  def change
    remove_column :sales, :sale_id, :integer
  end
end
