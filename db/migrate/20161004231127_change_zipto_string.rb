class ChangeZiptoString < ActiveRecord::Migration
  def change
    change_column :markets, :zip, :string
  end
end
