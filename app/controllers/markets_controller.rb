class MarketsController < ApplicationController
  def index
    @market = Market.find(current_user.id)
  end

  def show
  end

  def new
    @market = Market.new
    @method = 'post'
    @path = markets_create_path
  end

  def create
    @market = Market.create(name: params[:market][:name], address: params[:market][:address], city: params[:market][:city], county: params[:market][:county], state: params[:market][:state], zip: params[:market][:zip])
  end

  def edit
    @market = Market.find(params[:id])
    @method = 'put'
    @path = markets_update_path(@market.id)
  end

#{}"market"=>{"name"=>"Quincy Farmers Market", "address"=>"0 Denis Ryan Parkway", "city"=>"Quincy", "county"=>"Norfolk", "state"=>"Massachusetts", "zip"=>"21690"}

  def update
    @market = Market.find(params[:id])
    @market.update(name: params[:market][:name], address: params[:market][:address], city: params[:market][:city], county: params[:market][:county], state: params[:market][:state], zip: params[:market][:zip])

    redirect_to controller: "markets", action: "index"

  end

  def destroy
  end
end
