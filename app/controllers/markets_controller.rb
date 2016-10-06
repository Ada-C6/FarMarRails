class MarketsController < ApplicationController
  def index
    @markets = Market.all
  end

  def new
    @mymarket=Market.new
    @market_method = :post
    @market_path = markets_create_path
  end

  def create
    @mymarket = Market.new
    @mymarket.name = params[:market][:name]
    @mymarket.address = params[:market][:address]
    @mymarket.city = params[:market][:city]
    @mymarket.county=params[:market][:county]
    @mymarket.state=params[:market][:state]
    @mymarket.zip=params[:market][:zip]
    @mymarket.save
    redirect_to markets_index_path
  end

  def show
    #for some reason you don't need to change params[:id] to an integer
    @mymarket = Market.find(params[:id])
    @myvendors=@mymarket.vendors
    if @mymarket == nil
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def edit
    @mymarket = Market.find(params[:id])
    @market_method = :put
    @market_path = markets_update_path(@mymarket.id)
    if @mymarket == nil
          render :file => 'public/404.html',
              :status => :not_found
    end

  end

  def update
    @mymarket = Market.find(params[:id])

    if @mymarket == nil
      render :file => 'public/404.html',
          :status => :not_found
    end
    
    @mymarket.name = params[:market][:name]
    @mymarket.address = params[:market][:address]
    @mymarket.city = params[:market][:city]
    @mymarket.county=params[:market][:county]
    @mymarket.state=params[:market][:state]
    @mymarket.zip=params[:market][:zip]
    @mymarket.save
    redirect_to markets_show_path(@mymarket.id)
  end


  def destroy
  end
end
