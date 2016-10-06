class MarketsController < ApplicationController
  def index
    @markets = Market.all
  end

  def show
    @mymarket = Market.find(params[:id].to_i)
    @vendors = Vendor.all
  end

  def new
    @mymarket = Market.new
  end

  def create
    @mymarket = Market.new
    @mymarket.name = params[:market][:name]
    @mymarket.address = params[:market][:address]
    @mymarket.city = params[:market][:city]
    @mymarket.state = params[:market][:state]
    @mymarket.zip = params[:market][:zip]
    @mymarket.save

    redirect_to action: 'index'
  end

  def edit
    @mymarket = Market.find(params[:id])
  end

  def update
    @mymarket = Market.find(params[:id])
    @mymarket.name = params[:market][:name]
    @mymarket.address = params[:market][:address]
    @mymarket.city = params[:market][:city]
    @mymarket.county = params[:market][:county]
    @mymarket.state = params[:market][:state]
    @mymarket.zip = params[:market][:zip]
    @mymarket.save

    redirect_to action: 'index'
  end

  def destroy
  end
end
