class MarketsController < ApplicationController

  def index
      @markets = Market.all
   end

  def all
    #put a list of all the markets here
    @markets = Market.all
  end

  def show
    @market = Market.find(params[:id])
    @vendors_list = @market.vendors
  end

  def edit
    @edit_market = Market.find(params[:id])
  end

  def update
    @edit_market = Market.find(params[:id])
    if @edit_market.update(market_params) #if it saves successfully
      redirect_to markets_path
    else #if it doesn't save
      render :edit
    end
  end



  private

    def market_params
      params.require(:market).permit(:name, :address, :city, :state, :county, :zip)
    end
end
