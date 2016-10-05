class SalesController < ApplicationController
  def index
    @vendor = Vendor.find(params[:vendor_id])
    @all_sales_by_vendor = @vendor.sales
  end

  def new
    @sale = Sale.new
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.find(params[:product_id])
    @sale = Sale.new(sale_params, purchase_time: Time.now)
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

  private

  def sale_params
    params.require(:sale).permit(:amount)
  end

end
