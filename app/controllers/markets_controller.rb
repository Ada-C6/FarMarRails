class MarketsController < ApplicationController

  def index; end

  def all
    #put a list of all the markets here
    @markets = Market.all
  end

end
