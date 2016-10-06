class VendorsController < ApplicationController
  def index
  end

  def show
    @vendor = Vendor.find(params[:id])
    @market = Market.find(@vendor.market_id)
    #TODO: If we want to restrict users from messing with our URLs - changing the market_id in the URL when they're looking at a vendor, we should do some checking here to make sure that params[:market_id] == @vendor.market_id
  end

  def new
    @market = Market.find(params[:market_id])
    @vendor = @market.vendors.new
  end

  def create
    @market = Market.find(params[:market_id])
    @vendor = @market.vendors.new(vendor_params)

    if @vendor.save
      redirect_to market_path(@market)
    else
      render :edit
    end
  end

  private

  def vendor_params
    params.require(:vendor).permit(:market_id, :name, :num_employees)
  end
end
