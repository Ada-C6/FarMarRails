class MarketsController < ApplicationController

  def findMarket
    return Market.find(params[:id].to_i)
  end

  def index
    @markets = Market.all
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
    @market.state = params[:market][:state]
    @market.zip = params[:market][:zip]
    @market.county = params[:market][:county]

    if(@market.save)
        # Saved successfully; go to the index
        redirect_to :action => "index"
    else
        # Validation failed; show the "new" form again...
        render :action => :new
    end

  end

  def show
    @market = findMarket
  end

  def showstate
    puts params[:state]
    @markets = Market.where( state: params[:state] )
  end

  def edit
    @market = findMarket

    if @market == nil
          render :file => 'public/404.html',
              :status => :not_found
    end

  end

  def update
    @market = findMarket

    if @market == nil
          render :file => 'public/404.html',
              :status => :not_found
    end

    if @market.update(name: params[:market][:name], address: params[:market][:address], city: params[:market][:city], state: params[:market][:state], zip: params[:market][:zip], county: params[:market][:county])
      redirect_to action: "show"
    else
      render 'edit'
    end
  end


  def destroy
    @market = findMarket
    @market.destroy

    redirect_to action: "index"
  end
end
