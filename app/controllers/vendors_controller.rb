class VendorsController < ApplicationController

  def index
    @vendor = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

end
