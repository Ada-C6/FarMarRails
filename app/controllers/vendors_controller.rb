class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      redirect_to market_path
    else
      render :new
    end
  end

  def destroy
    @vendor = Vendor.find(params[:id]).destroy
    redirect_to market_path
  end

  def edit  # Will give the form, like new
    @vendor = Vendor.find(params[:id])
    @market = Market.find(params[:market_id])
  end

  def update # Actually do the update, like create
    @vendor = Vendor.find(params[:id])
    if @vendor.update(vendor_params)
      redirect_to market_path
    else
      render :edit
    end
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :employee_number,
      :markets => [:name, :address, :city, :county, :state, :zip])
  end
end
