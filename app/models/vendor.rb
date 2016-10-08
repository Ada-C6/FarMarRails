class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :products
  has_many :sales

  def total_all_sales
    all_sales = self.sales

    total = 0
    all_sales.each do |sale|
      total += sale.amount
    end
    return total
  end

  def current_month_sales
    all_sales = self.sales

    all_sales.where(amount: 8382) #only finding a specific sale currently so I can test that calling the method in the sale show page works correctly. did not get to the logic to isolate only the current month sales
  end #should return a collection of sales from the current month

  def current_month_sales_total
    total = 0

    current_month_sales.each do |sale|
      # TODO: need a conditional here to add to the total using logic for isolating current month sales - did not get to the logic during th assignment time
      total += sale.amount
    end
    return total
  end
end
