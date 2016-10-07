class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product



  # def self.total_sales_by_vendor
  #   total = []
  #   @sale = Sale.find_by
  #   total << @sale.amount
  #   total.inject(0){|sum, x| sum + x }
  # end
end
