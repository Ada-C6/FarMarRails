class MarketsController < ApplicationController
  def index
    @markets = Market.all
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

  

# TODO:
# markets#edit
# markets#show
# markets#update

# ---- PRIVATE METHODS ----

  private

  def market_params
    params.require(:market).permit(:name, :address, :city, :county, :state, :zip)
  end
end
