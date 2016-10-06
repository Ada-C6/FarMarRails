class MarketsController < ApplicationController
  def index
    @markets = Market.all
  end

  def show
    @market = Market.find(params[:id])
    @vendors = Vendor.where(market_id: params[:id])
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.new(market_params)
    if @market.save
      redirect_to markets_path
    else
      render :new
    end

  end

  def edit
    @market = Market.find(params[:id])
  end

  def update
    @market = Market.find(params[:id])

    if @market.update(market_params)
      redirect_to markets_path
    else
      render :edit
    end

  end

# we don't need this. We can already see the damn vendors.
# make a link to each vendor (that is vendor#show in vendors_controller) and that is literally all we need. you cannot get to that vendor display as a vendor. Then put delete and edit buttions on that, again run through the vendors controller. God, I wish we'd had a chance to talk with a tutor around 4:30 when we wanted to. Oh well.
  def show_vendors
    @vendors = Vendor.all
  end

  private

  def market_params
    params.require(:market).permit(:name, :address, :city, :state, :zip)
  end


end
