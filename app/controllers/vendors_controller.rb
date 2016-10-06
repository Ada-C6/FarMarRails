class VendorsController < ApplicationController
  def index; end

  def show
    @market = Market.find(params[:market_id])
    @vendor = Vendor.find(params[:id])
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    if @vendor.update(vendor_params) #if it saves successfully
    @vendor.market_id = params[:market_id]
    redirect_to market_vendors_path
    else #if it doesn't save
      render :edit
    end
  end

  # def new; end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :num_employees)
  end
end
