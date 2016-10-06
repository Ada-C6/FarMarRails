module SalesHelper
  def product_name(sale)
    product = Product.find(sale.product_id)
    product.name
  end
end
