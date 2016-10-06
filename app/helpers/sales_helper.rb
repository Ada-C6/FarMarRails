module SalesHelper
  def product_name(sale)
    product = Product.find(sale.product_id)
    product.name
  end

  def total_sales
    total = 0
    @sales.each do |sale|
      total += sale.amount
    end
    return total
  end
end
