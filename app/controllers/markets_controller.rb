class MarketsController < ApplicationController

  def index
    @market = Market.all
  end

  def show
    @vendor = Vendor.find(params[:id])
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

  def edit
    @market = Market.find(params[:id])
  end

  def update
    @market = Market.find(params[:id])
    if @market.update(params[:id])
      redirect_to markets_path
    else
      render :edit
    end
  end
  private
  def market_params
    params.require(:market).permit(:name, :address, :city, :county, :state, :zip)
  end

end
