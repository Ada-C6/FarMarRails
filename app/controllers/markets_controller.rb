class MarketsController < ApplicationController

  def index1
    @market_list = Market.all
  end

  def show1
    this_market = Integer(params[:id])
    @this_market = Market.find(this_market)
  end

  def index2
    @market_list = Market.all
  end

  def show2
    this_market = Integer(params[:id])
    @this_market = Market.find(this_market)
  end


  def new
    @new_market = Market.new
  end

  def create
    @new_market = Market.new(market_params)
    @new_market.save
    if @new_market.save
      redirect_to market_views_path
    else
      render :new
    end
  end
end
