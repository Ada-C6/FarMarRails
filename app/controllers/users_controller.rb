class UsersController < ApplicationController
  def index
  end

  def show
  end

  def markets
    @market = Market.all
  end
end
