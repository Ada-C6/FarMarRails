class MarketsController < ApplicationController
  def index
    @markets = Market.all
  end

  def new
    @market = Market.new
  end

  def show
  end

  def edit
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

  def update
  end

  def destroy
  end
end
