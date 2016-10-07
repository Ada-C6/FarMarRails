module VendorsHelper

  def sales_sum(vendor)
    sum = 0
    vendor.sales.each do |sale|
      sum += sale.amount
    end
    return sum/100.0
  end

  def sales_sum_month(array_sales)
    month_total = 0
    array_sales.each do |sale|
      month_total += sale.amount
    end
    return month_total/100.0
  end
  
  # def sales_month(vendor)
  #   month_total = 0
  #   vendor.sales.each do |sale|
  #     current_month = Time.now.utc
  #     if sale.purchase_time.strftime("%Y-%m") == current_month.strftime("%Y-%m")
  #       month_total += sale.amount
  #     end
  #   end
  #   return month_total/100.0
  # end

end
