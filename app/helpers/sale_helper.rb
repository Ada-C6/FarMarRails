module SaleHelper
  require 'path_check.rb'
  include PathCheck

  def total_sales(sales)
    total = []

    sales.each do |sale|
      total << sale.amount.to_f.round(2)
    end

    total = total.reduce(:+)

    return total / 100.00
  end

  def current_month?(time)
    time = time.to_datetime

    if time > (DateTime.now - 30)
      return true
    else
      return false
    end
  end


end
