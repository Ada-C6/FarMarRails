class RemoveColumnFromMarkets < ActiveRecord::Migration
  def change
    remove_column :markets, :market_id, :integer
  end
end
