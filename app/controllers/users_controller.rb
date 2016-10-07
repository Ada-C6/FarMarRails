class UsersController < ApplicationController
  def index
  end

  def show
    @markets = Market.all
    @vendors = Vendor.all

    @user = params[:type]
    # if @user == "vendor"
    #   redirect_to index_vendors_url(type: @user)
    # end
  end

  def new

  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy

  end
end
