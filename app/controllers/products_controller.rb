class ProductsController < ApplicationController

  def index
    @vendor = Vendor.find(params[:vendor_id])
    @product_list = @vendor.products
  end

  def show
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.find(params[:id])
  end

end
