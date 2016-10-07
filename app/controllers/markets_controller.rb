class MarketsController < ApplicationController

  def index
    @markets = Market.all
  end

  def show
    @market = Market.find(params[:id])
    @vendors = @market.vendors
  end

  def new
    @market = Market.new
  end

  def edit
  
  end

end
