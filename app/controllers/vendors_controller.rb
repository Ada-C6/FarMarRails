class VendorsController < ApplicationController
  def index
    @vendor_list = Vendor.all
  end

  def show
    this_vendor = Integer(params[:id])
    @this_vendor = Vendor.find(this_vendor)
  end
end
