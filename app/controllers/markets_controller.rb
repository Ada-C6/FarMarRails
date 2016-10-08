class MarketsController < ApplicationController
  def overview
  end

  def view_markets # show all markets
    @markets = Market.all
  end

  def view_market # show a market
    @market = Market.find(params[:id])
    @vendors = @market.vendors
  end

  def index
    @markets = Market.all
  end

  def show
    @market = Market.find(params[:id])
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.new(market_params)
    if @market.save
      redirect_to markets_path
    else
      render :new
    end
  end

  def edit #
    @market = Market.find(params[:id])
  end

  def update #
    @market = Market.find(params[:id])
    if @market.update(market_params)
      redirect_to markets_path
    else
      render :edit
    end
  end

  def market_vendors
    @market = Market.find(params[:id])
    @vendors = @market.vendors
  end

  def market_new_vendor
    @market = Market.find(params[:id])
    @vendor = @market.vendors.build
  end

  def market_create_vendor
    @market = Market.find(params[:id])
    @vendor = @market.vendors.build(vendor_params)
    if @vendor.save
      redirect_to market_view_vendors_path
    else
      render :market_new_vendor
    end
  end

  private

  def market_params
    params.require(:market).permit(:ref_id, :name, :address, :city, :county, :state, :zip)
  end

  def vendor_params
    params.require(:vendor).permit(:ref_id, :name, :num_employees, :market_id)
  end
end
