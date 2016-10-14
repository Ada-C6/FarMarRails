class SalesController < ApplicationController
  def index
    this_vendor = Integer(params[:id])
    @this_vendors_sales = Sale.where(vendor_id: this_vendor)

    #TODO: return sales list and total by month
    # @current_time = DateTime.now.strftime "%m/%y"
    # @start = Date.new(2013,11)
    # @current_month = @start..(@start + 30)
  end

  def new
    this_vendor = Vendor.find(params[:id]).id
    this_product = Product.where(vendor_id: this_vendor)
    @new_sale = Sale.new(vendor_id: this_vendor, product_id: this_product)
  end

  def create
    this_vendor = Vendor.find(params[:id]).id
    this_product = Product.where(vendor_id: this_vendor)
    @new_sale = Sale.new(vendor_id: this_vendor, product_id: this_product)
    @new_sale.save
    if @new_sale.update(sale_params)
      redirect_to vendor_sales_path
    else
      render :new
    end
  end

  private
  def sale_params
    params.require(:sale).permit(:amount, :time)
  end
end
