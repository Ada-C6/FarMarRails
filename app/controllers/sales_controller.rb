class SalesController < ApplicationController
  def index
    @vendor = Vendor.find(params[:vendor_id])
    @sales = @vendor.sales

  end
end
