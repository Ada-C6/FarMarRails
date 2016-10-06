class ProductsController < ApplicationController
  def index
    this_vendor = Integer(params[:id])
    @this_vendors_products = Product.where(vendor_id: this_vendor)
  end
end

private
