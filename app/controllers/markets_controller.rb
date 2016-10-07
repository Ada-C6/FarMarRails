class MarketsController < ApplicationController
  def index
    @markets = Market.all
  end

  def show
    @market = Market.find(params[:id])
    @vendors = @market.vendors
    @user = params[:type]
    # @vendors = Vendor.find_by(market_id: params[:id])
  end

  def new
    @market = Market.new
    # @method = :post
  end

  def create
    @market = Market.new(name: params[:market][:name], address: params[:market][:address], city: params[:market][:city], county: params[:market][:county], state: params[:market][:state], zip: params[:market][:zip])
    @market.save

    redirect_to show_users_url(type: "market")
  end

  def edit
    @market = Market.find(params[:id])

    # @method = :put
  end

  def update
    @market = Market.update(params[:id], {name: params[:market][:name], address: params[:market][:address], city: params[:market][:city], county: params[:market][:county], state: params[:market][:state], zip: params[:market][:zip]})

    redirect_to show_users_url(type: "market")
  end

  def destroy
    @market = Market.find(params[:id])
    @market.destroy

    redirect_to show_users_url(type: "market")
  end
end
