class MarketsController < ApplicationController

  def index1
    @market_list = Market.all
  end

  def show1
    id = Integer(params[:id])
    @this_market = Market.find(id)
    @vendor = Vendor.where(market_id: id )
  end

  def index2
    @market_list = Market.all
  end

  def show2
    this_market = Integer(params[:id])
    @this_market = Market.find(this_market)
    @id = params[:id]
    @vendor = Vendor.where(market_id: params[:id] )
  end


  def new
    @new_market = Market.new
  end

  def create
    @new_market = Market.new(market_params)
    @new_market.save
    redirect_to farmers_market_views_path
  end

  def edit
    @this_market = Market.find(params[:id])

  end

  def update
    @this_market = Market.find(params[:id])

    if @this_market.update(market_params)
      redirect_to farmers_market_views_path
    else
      render :edit
    end
  end

  private

  def market_params
    params.require(:market).permit(:name, :address, :city, :county, :state, :zip)
  end

end
