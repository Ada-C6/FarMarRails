class GeneralUsersController < ApplicationController
  def index
    @allmarkets = Market.all
  end

  def show
    @market = Market.find(params[:id].to_i)
    @allvendors = Vendor.all
  end
end
