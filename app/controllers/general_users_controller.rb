class GeneralUsersController < ApplicationController
  def index
    @allmarkets = Market.all
  end

  def show
    @market = Market.find(params[:id].to_i)
    @allvendors = @market.vendors
  end

  def sort_by
    @allmarkets = Market.all.order(params[:sort])
    render :index
  end

end
