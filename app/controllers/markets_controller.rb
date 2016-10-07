class MarketsController < ApplicationController
  def index
    @markets = Market.all.order(:name)
  end #index

  def show
    @market = Market.find(params[:id])
  end #show

  def new
    @market = Market.new
  end #new

  def create
    @market = Market.new(market_params)

    if @market.save
      redirect_to market_path(@market)
    else
      render :new
    end
  end #create

  def edit
    @market = Market.find(params[:id])
  end #edit

  def update
    @market = Market.find(params[:id])

    if @market.update(market_params)
      redirect_to market_path(@market)
    else
      render :edit
    end
  end #update

  def destroy
    @market = Market.find(params[:id])
    @market.destroy
    redirect_to markets_path
  end

  private

  def market_params
    params.require(:market).permit(:name, :street_address, :city, :county, :state, :zip_code)
  end
end
