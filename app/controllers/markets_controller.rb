class MarketsController < ApplicationController
  def findMarket
    return Market.find(params[:id].to_i)
  end

  def index
    @markets = Markets.all
  end

  def show
    @mymarket = findMarket
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def vendor_index
  end

  def vendor_show
  end

  def vendor_new
  end

  def vendor_create
  end

  def vendor_edit
  end

  def vendor_update
  end

  def vendor_destroy
  end
end
