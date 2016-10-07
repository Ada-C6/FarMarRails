class SalesController < ApplicationController

  def index
    @vendor = Vendor.find(params[:vendor_id])
    @sales = @vendor.sales
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.find(params[:product_id])
    @sale = Sale.new
    @sale.vendor_id = params[:vendor_id]
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @sale = Sale.new(sale_params)
    @sale.vendor_id = params[:vendor_id]
    @sale.product_id = params[:id]
    if @sale.save
      redirect_to vendor_sales_path
    else
      render :new
    end
  end

private

  def sale_params
    params.require(:sale).permit(:amount, :purchase_time)
  end
end
