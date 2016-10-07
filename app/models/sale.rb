class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product

  # def total_revenue
  #   total_sales = 0
  #   # sales = Sale.find_by(vendor_id: id)
  #
  #   sale_ids.each do |sale_id|
  #     sales << Sale.find(sale_id)
  #   end
  #
  #   sales.each {|sale| total_sales += sale.amount}
  #   return total_sales
  # end
end
