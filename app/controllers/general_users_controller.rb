class GeneralUsersController < ApplicationController
  def index
    @allmarkets = Market.all
  end

  def show
  end
end
