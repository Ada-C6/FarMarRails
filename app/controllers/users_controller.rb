class UsersController < ApplicationController
  def index
  end

  def show
    @market = Market.find(params[:id])
  end

  def markets
    @market = Market.all
  end
end
