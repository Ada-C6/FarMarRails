class MarketsController < ApplicationController
  def index
    @markets = Market.all
  end

  def show
    @market = Market.find(params[:id])
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end




end
