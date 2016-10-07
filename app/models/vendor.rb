class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :products
  has_many :sales

  def total_revenue
    revenue = 0

    sales.each do |sale|
      revenue += sale.amount
    end

    return revenue
  end

  def revenue_between(beginning_time, end_time)
    sales_between = 0

    sales.each do |sale|
      if sale.purchase_time >= beginning_time && sale.purchase_time < end_time
        sales_between += sale.amount
      end
    end
    return sales_between
  end

  def revenue_by_month(month, year)
    beginning_time = DateTime.new(year, month)
    end_time = DateTime.new(year, month+1)

    revenue = revenue_between(beginning_time, end_time)

    return revenue
  end

end
