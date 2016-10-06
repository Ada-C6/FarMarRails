class VendorsController < ApplicationController
  def index; end

  def show
    @market = Market.find(params[:market_id])
    @vendor = Vendor.find(params[:id])
  end

  def new;
  end

  def edit
    @market = Market.find(params[:market_id])
    @vendor = Vendor.find(params[:id])
    # @vendor = Vendor.find(params[:market_id])
  end

  def update ##fix the submit button on form partial
    @market = Market.find(params[:market_id])
    @vendor = Vendor.find(params[:id])
    if @vendor.update(vendor_params) #if it saves successfully
    # @vendor.market_id = params[:market_id]
    redirect_to market_path
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
