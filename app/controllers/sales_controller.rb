class SalesController < ApplicationController
  def index
    this_vendor = Integer(params[:id])
    @this_vendors_sales = Sale.where(vendor_id: this_vendor)


    # @current_time = DateTime.now.strftime "%m/%y"
    @start = Date.new(2013,11)
    @current_month = @start..(@start + 30)
  end

  def new
    this_vendor = Vendor.find(params[:id])

  end
end
