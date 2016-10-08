class VendorsController < ApplicationController

  def index
    @vendor = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
    @vendor.save
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new
    @vendor.name = params[:vendor][:name]
    @vendor.number_employees = params[:vendor][:name]
    @vendor.market_id = params[:market_id] #didn't finish - not assigning correctly
    if @vendor.save
      redirect_to markets_path #didn't finish - want to direct somewhere else when not debugging
    else
      render :new
    end
  end

  def destroy
    @vendor = Vendor.find(params[:id]).destroy
    redirect_to vendors_path
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    if @vendor.update(vendor_params)
      redirect_to vendor_path(params[:id])
    else
      render :edit
    end
  end


  private

  def vendor_params
    params.require(:vendor).permit(:id, :name, :number_employees, :market_id)
  end
end
