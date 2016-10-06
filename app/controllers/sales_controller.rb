class SalesController < ApplicationController
  def index
    @vendor = Vendor.find(params[:vendor_id])
    @all_sales_by_vendor = @vendor.sales

    total_sales_cents = 0
    @all_sales_by_vendor.each do |sale|
      total_sales_cents += sale.amount
    end
    @total_sales_amount = total_sales_cents / 100
  end

  def new
    @sale = Sale.new
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.find(params[:product_id])
    @sale = Sale.new(sale_params)
    @sale.purchase_time = Time.now
    @sale.amount = @sale.amount * 100
    @product.sales << @sale
    @vendor.sales << @sale

    if @sale.save
      # saved successfully
      redirect_to vendor_products_path
    else
      # did not save
      render :new
    end
  end

  def current_sales
    @vendor = Vendor.find(params[:vendor_id])
    @all_sales_by_vendor = @vendor.sales

    @date = Date.today
    @current_month = @date.strftime( "%B%Y" )
    @all_current_sales = Sale.by_month( @current_month, field: :purchase_time )

    all_current_sales_cents = 0
    @all_current_sales.each do |sale|
      all_current_sales_cents += sale.amount
    end
    @all_current_sales_amount = all_current_sales_cents / 100

  end

  private

  def sale_params
    params.require(:sale).permit(:amount)
  end

end
