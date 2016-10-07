class SalesController < ApplicationController
  def index
    @vendor = Vendor.find(params[:vendor_id])
    @sales = @vendor.sales

    @current_sales = @sales.where(purchase_time: (1.month.ago)...DateTime.now)
    # current sales is supposed to be "this month", and what it's currently doing is the sales from a month ago up to now (so not restricted on THIS month)
  end
end
