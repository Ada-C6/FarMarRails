class SalesController < ApplicationController
  def index
    @market = Market.find(params[:market_id])
    @vendor = Vendor.find(@market.id)
    @sales = @vendor.sales
  end
end
