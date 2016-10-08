class SalesController < ApplicationController
  def new
    # vendor_id = params[:vendor_id]
    # @vendor = Vendor.find(vendor_id)
    product_id = params[:product_id]
    @product = Product.find(product_id)
    @sale = @product.sales.build
  end

  def create
    product_id = params[:product_id]
    @product = Product.find(product_id)
    @sale = @product.sales.create(sales_params)
    redirect_to vendor_path(params[:vendor_id])
  end

  private

  def  sales_params
    params.require(:sale).permit(:amount, :purchase_time)
  end
end
