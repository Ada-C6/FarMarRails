class MarketsController < ApplicationController

  def index; end

  def all
    #put a list of all the markets here
    @markets = Market.all
  end

  def show
    @market = Market.find(params[:id])
    @vendors_list = @market.vendors
  end
end
