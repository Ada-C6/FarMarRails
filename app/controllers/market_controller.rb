class MarketController < ApplicationController
  def index
    @markets = Market.all
  end

  def create
    @market = Market.create(market_params)

    redirect_to root_path
  end

  def new
    @market = Market.new
  end

  def edit
    @market = Market.find(params[:id])
  end

  def show
    @market = Market.find(params[:id])
  end

  def update
    @market = Market.find(params[:id])

    if @market.update(market_params)
      redirect_to market_path
    else
      render :edit
    end
  end

  def destroy
    @market = Market.find(params[:id]).destroy

    redirect_to market_index_path
  end

####### STRONG PARAMS #########

  private

  def market_params
    params.require(:market).permit(:name, :address, :city, :county, :state, :zip)
  end

end
