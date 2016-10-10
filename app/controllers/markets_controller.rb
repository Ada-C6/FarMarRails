class MarketsController < ApplicationController
  #before_action :get_id

  # before_action :check_privileges
  #
  # def check_privileges
  #   if user_type != 'market'
  #     render :file => 'public/404.html', :status => :not_found
  #   end
  # end

  def get_id
    @user = params[:user_type]
  end

  def index
    @market = Market.find(current_user.id)
  end

  def show
    if user_type != 'market'
      redirect_to sessions_index_path
    end
  end

  def new
    if user_type != 'market'
      redirect_to sessions_index_path
    end

    @market = Market.new
    @method = 'post'
    @path = markets_create_path
  end

  def create
    if user_type != 'market'
      redirect_to sessions_index_path
    end

    @market = Market.create(name: params[:market][:name], address: params[:market][:address], city: params[:market][:city], county: params[:market][:county], state: params[:market][:state], zip: params[:market][:zip])
  end

  def edit
    if user_type != 'market'
      redirect_to sessions_index_path
    end

    @market = Market.find(params[:id])
    @method = 'put'
    @path = markets_update_path(@market.id)
  end

#{}"market"=>{"name"=>"Quincy Farmers Market", "address"=>"0 Denis Ryan Parkway", "city"=>"Quincy", "county"=>"Norfolk", "state"=>"Massachusetts", "zip"=>"21690"}

  def update
    if user_type != 'market'
      redirect_to sessions_index_path
    end

    @market = Market.find(params[:id])
    @market.update(name: params[:market][:name], address: params[:market][:address], city: params[:market][:city], county: params[:market][:county], state: params[:market][:state], zip: params[:market][:zip])

    redirect_to controller: "markets", action: "index"

  end

  def destroy
    if user_type != 'market'
      redirect_to sessions_index_path
    end
  end

end
