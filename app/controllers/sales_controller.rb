class SalesController < ApplicationController
  def index
    this_vendor = Integer(params[:id])
    @this_vendors_sales = Sale.where(vendor_id: this_vendor)
  end

  def new
    this_vendor = Vendor.find(params[:id]).# IDEA:
    
  end
end
