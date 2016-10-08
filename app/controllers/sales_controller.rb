class SalesController < ApplicationController

  def index
    @vendor = Vendor.find(params[:vendor_id])
    @sales = @vendor.sales

    @total_sales = @vendor.total_all_sales

    @this_month_sales = @vendor.current_month_sales

    @this_month_sales_total = @vendor.current_month_sales_total
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new
    @sale.amount = params[:sale][:amount]
    @sale.purchase_time = Time.now
    @sale.vendor_id = params[:vendor_id]
    @sale.product_id = params[:sale][:product_id]

    if @sale.save
      redirect_to vendor_sales_path
    else
      render :new
    end
  end

end
