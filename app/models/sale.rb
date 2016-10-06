class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product

  def self.total(sales)
    total = 0
    sales.each do |sale|
      total += sale.amount
    end
    return total
  end

  def self.monthfind(sales)
    current_month_sales = []
    sales.each do |sale|
      if sale.purchase_time.month == Time.now.month
        current_month_sales << sale
      end
    end
    return current_month_sales
  end

end
