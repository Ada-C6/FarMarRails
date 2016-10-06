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
    @mymarket = Market.new
  end

  def create
    @params = params
    @mymarket = Market.new
    @mymarket.name = params[:market][:name]
    @mymarket.address = params[:market][:address]
    @mymarket.city = params[:market][:city]
    @mymarket.county = params[:market][:county]
    @mymarket.zip = params[:market][:zip]
    @mymarket.save

    redirect_to show_market_path(@mymarket.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

private
def params
  params.require(:market).permit(:name, :address, :city, :county, :state, :zip)
end
