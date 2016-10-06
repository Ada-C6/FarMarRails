class UsersController < ApplicationController
  def index
    @market = Market.new
    @markets = Market.all
  end

  def show
    @market = Market.find(params[:id])
  end

  def create

  end

  def search_market

  end

end
