class MarketsController < ApplicationController
  before_filter :set_search

  def index
    if params[:commit] == "search"
      if !params[:q].blank?
        @results = Market.search(params[:q])
      else
        @results = Market.search({:id_eq => 0})
      end

      @markets = @results.result

    else
      @markets = Market.all
    end

  end

  def all
    @markets = Market.all
  end

  def show
    find

    @vendor = Vendor.new
  end

  def guest_show
    find
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.new

    @market.name = params[:market][:name]
    @market.address = params[:market][:address]
    @market.city = params[:market][:city]
    @market.county = params[:market][:county]
    @market.state = params[:market][:state]
    @market.zip = params[:market][:zip]

    @market.save

    redirect_to action: 'show', id: @market.id
  end

  def edit
    find
  end

  def update
    find

    @market.name = params[:market][:name]
    @market.address = params[:market][:address]
    @market.city = params[:market][:city]
    @market.county = params[:market][:county]
    @market.state = params[:market][:state]
    @market.zip = params[:market][:zip]

    @market.save

    redirect_to action: 'show', id: @market.id
  end

  def destroy
    find
    @market.destroy

    redirect_to markets_url
  end

  private
  def find
    @market = Market.find(params[:id].to_i)
  end
end
