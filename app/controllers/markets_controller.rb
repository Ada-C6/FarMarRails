class MarketsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
    @mymarket=Market.find(params[:id])
    @myvendors=@mymarket.vendors
  end

  def edit
  end

  def destroy
  end
end
