class VendorsController < ApplicationController
  def index; end

  def show
  @market = Market.find(params[:market_id])

  @vendor = Vendor.find(params[:id])
  end

  # def new; end

end
