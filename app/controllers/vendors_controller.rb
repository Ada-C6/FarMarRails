class VendorsController < ApplicationController
  # before_action :get_id
  # before_action :get_authorization, only: [:destroy, :edit, :new]

  # def get_id
  #   @user = params[:user_type][:id]
  # end

  # def get_auth
  #   if current_user.id != @vendors.market_id
  #     flash [:notice] "You are not authorized to access this information"
  #   end
  # end

  # before_action :check_privileges, only: [:show, :new, :create, :edit, :update, :destroy]
  # before_action :check_privileges_vendor, only: [:index]
  #
  # def check_privileges
  #   if user_type != 'market'
  #     render :file => 'public/404.html', :status => :not_found
  #   end
  # end
  #
  # def check_privileges_vendor
  #   if user_type != 'vendor'
  #     render :file => 'public/404.html', :status => :not_found
  #   end
  # end

  def index
    @vendor = Vendor.find(current_user.id)
  end

  def show
    @market = Market.find(current_user.id)
  end

  def new
    @market_vendor = Vendor.new
  end

  def create
    @params = params
    @market_vendor = Vendor.new
    @market_vendor.name = params['vendor']['name']
    @market_vendor.num_employees = params['vendor']['num_employees']
    @market_vendor.market_id = params['vendor']['market_id']
    @market_vendor.save
    redirect_to vendors_show_path
  end

  def edit
    @market_vendor = Vendor.find(params[:id])
  end

  def update
    @params = params
    @market_vendor = Vendor.find(params[:id])
    @market_vendor.name = params['vendor']['name']
    @market_vendor.num_employees = params['vendor']['num_employees']
    @market_vendor.market_id = params['vendor']['market_id']
    @market_vendor.save
    redirect_to vendors_show_path

  end

  def destroy
    @market_vendor = Vendor.find(params[:id])
    @market_vendor.destroy
    @destroy_msg = "Vendor successfully deleted."
  end

end
