class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def show
    @market = Market.find(params[:market_id])
    @vendor = Vendor.find(params[:id])
  end

  # def new; end

end
