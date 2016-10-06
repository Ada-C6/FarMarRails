class MarketAdminsController < ApplicationController

  def find_all
    @markets = Market.all
    @vendors = Vendor.all
  end

  def find_market
    return Market.find(params[:id].to_i)
  end

  def index
    find_all
  end

  def show
    find_all
    @market = find_market
    @vendor_list = []
    @vendors.each do |vendor|
      if vendor.market_id == @market.id
      @vendor_list << vendor
      end
    end
    return @vendor_list
  end

  def new
    @market = Market.new
  end

  def create
    @params = params
    @market = Market.new
    @market.name = params[:market][:name]
    @market.address = params[:market][:address]
    @market.city = params[:market][:city]
    @market.county = params[:market][:county]
    @market.state = params[:market][:state]
    @market.zip = params[:market][:zip]
    @market.save

    redirect_to show_market_path(@market.id)
  end

  def edit
    show
  end

  def update
    @params = params
    @market = find_market
    @market.name = params[:market][:name]
    @market.address = params[:market][:address]
    @market.city = params[:market][:city]
    @market.county = params[:market][:county]
    @market.state = params[:market][:state]
    @market.zip = params[:market][:zip]
    @market.save

    redirect_to show_market_path(@market.id)
  end

  def destroy
  end
end

private
def params
  params.require(:market).permit(:name, :address, :city, :county, :state, :zip)
end
