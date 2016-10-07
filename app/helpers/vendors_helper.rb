module VendorsHelper

  def sales_sum(vendor)
    sum = 0
    vendor.sales.each do |sale|
      sum += sale.amount
    end
    return sum/100.0
  end

end
