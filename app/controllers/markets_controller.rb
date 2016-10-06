class MarketsController < ApplicationController
  def index
    # all of the markets alphabetized
    @markets = Market.order(:name)
  end

  def show
    @market = Market.find(params[:id])
    @vendors = @market.vendors
  end

  def new
    @market = Market.new
  end

  def edit
    @market = Market.find(params[:id])
  end

  def create
    @market = Market.new(market_params)

    if @market.save
      redirect_to markets_path
    else
      render :new
    end
  end

  def update
    @market = Market.find(params[:id])

    if @market.update(market_params)
      redirect_to market_path
    else
      render :new
    end
  end

  private
  def market_params
    params.require(:market).permit(:name, :address, :city, :county, :state, :zip)
  end

end
