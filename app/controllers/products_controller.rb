class ProductsController < ApplicationController
  def index
    this_vendor = Integer(params[:id])
    @this_vendors_products = Product.where(vendor_id: this_vendor)
  end

  def new; end

  def create_product
    this_vendor = Integer(params[:id])
    @this_product = Product.new
    @this_product.vendor_id = this_vendor.id
    @this_product.save
    if @this_product.save
      redirect_to vendor_products_new_path
    else
      render :new_product
    end
  end
end

private
