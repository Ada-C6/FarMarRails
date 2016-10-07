class VendorController < ApplicationController

  def index
    if params[:market_id] != nil
      market = Market.find(params[:market_id])
      @vendors = market.vendors
      return @vendors
    else
      @vendors = Vendor.all
    end
  end

  def create
    @vendor = Vendor.create!(vendor_params)

    redirect_to market_vendor_index_path(vendor_params[:market_id])
  end

  def new
    @vendor = Vendor.new
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])

    if @vendor.update!(vendor_params)
      redirect_to vendor_path
    else
      render :edit
    end
  end

  def destroy
    @vendor = Vendor.find(params[:id]).destroy
   redirect_to vendor_index_path
  end


####### STRONG PARAMS #########

  private

  def vendor_params
    params.require(:vendor).permit(:name, :num_employees, :market_id)
  end
end
