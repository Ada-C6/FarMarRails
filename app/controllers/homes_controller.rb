class HomesController < ApplicationController

  def show_markets
    @markets = Market.all
  end

  def show
    @market = Market.find(params[:id])
  end
end
