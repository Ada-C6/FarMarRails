class AddColumnsToMarket < ActiveRecord::Migration
  def change
    add_column :markets, :state, :string
    add_column :markets, :zip, :string
  end
end
