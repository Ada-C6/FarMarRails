class SalesController < ApplicationController

  def index
    @vendor = Vendor.find(params[:vendor_id])
    @sales = @vendor.sales
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @sale = @vendor.sales.build
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @sale = @vendor.sales.new(sale_params)
    if @sale.save
      # SAVED SUCCESSFULLY
      redirect_to vendor_sales_path
    else
      # DID NOT SAVE
      puts @sale.errors.messages
      render :new
    end
  end

  private

  def sale_params
    params.require(:sale).permit(:ref_id, :product_id, :vendor_id, :amount, :purchase_time)
  end

end
