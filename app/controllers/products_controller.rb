class ProductsController < ApplicationController
  def index
    this_vendor = Integer(params[:id])
    @this_vendors_products = Product.where(vendor_id: this_vendor)
  end

  def new
    this_vendor = Vendor.find(params[:id]).id
    @new_product = Product.new(vendor_id: this_vendor)
  end

  def create
    this_vendor = Integer(params[:id])
    @new_product = Product.new(vendor_id: this_vendor)
    @new_product.save
    if @new_product.update(product_params)
      redirect_to vendor_products_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name)
  end
end
