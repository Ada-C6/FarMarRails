class SalesController < ApplicationController

  def index
    @sales = Sale.all
  end

  def show
    @sale = Sale.find(params[:id])
    @vendor= Vendor.find(@sale.vendor_id)
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @product = @vendor.products.find(params[:product_id])
    @sale = @product.sales.new
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @product = @vendor.products.find(params[:product_id])
    @sale = @product.sales.new
    @sale.vendor_id = params[:vendor_id]

    if @sale.save
      redirect_to vendor_path(@sale.vendor_id)
    else
      render :new
    end
  end

  private

  def sale_params
    params.require(:sale).permit(:name, :product_id, :vendor_id, :purchase_time, :amount)
  end


end
