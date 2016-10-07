class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product



  # def total_sales
  #   total = []
  #   @sale = Sale.find(params[:id])
  #   total << @sale.amount
  #   total.inject(0){|sum,x| sum + x }
  # end
end
