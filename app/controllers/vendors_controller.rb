class VendorsController < ApplicationController
  def index
  end

  def show
    @vendor = Vendor.find(params[:id])
    @market = Market.find(@vendor.market_id)
    #TODO: If we want to restrict users from messing with our URLs - changing the market_id in the URL when they're looking at a vendor, we should do some checking here to make sure that params[:market_id] == @vendor.market_id
  end
end
