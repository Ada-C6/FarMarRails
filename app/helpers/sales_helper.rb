module SalesHelper
  def display_sales(sale)
    return sale.purchase_time.strftime("%H:%M %Y-%m-%d") + ": #{sale.amount} cents"
  end

end
