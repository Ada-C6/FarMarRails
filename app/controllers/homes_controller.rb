class HomesController < ApplicationController



  def index
    render layout: "homepage"
  end

  def markets_index
    @markets = Market.all
  end

  def markets_show
    @market = Market.find(params[:id])
    @vendors = @market.vendors
  end

end
