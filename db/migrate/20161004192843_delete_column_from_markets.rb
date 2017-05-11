class DeleteColumnFromMarkets < ActiveRecord::Migration
  def change
    remove_column :markets, :state, :string
    remove_column :markets, :zip, :string
  end
end
