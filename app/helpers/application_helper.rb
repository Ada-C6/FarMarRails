module ApplicationHelper

  def sales_month(vendor)
    sales_current_month = []
    vendor.sales.each do |sale|
      current_month = Time.now.utc
      if sale.purchase_time.strftime("%Y-%m") == current_month.strftime("%Y-%m")
        sales_current_month << sale
      end
    end
    return sales_current_month
  end
    
end
