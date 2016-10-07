class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :products
  has_many :sales

  def sales_total
    total = 0
    @sales.each do |sale|
      total += sale.amount.to_i
    end
  end
end
