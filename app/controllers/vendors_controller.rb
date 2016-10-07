class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def show
    @market = Market.find(params[:market_id])
    @vendor = Vendor.find(params[:id])
  end

  def new
    @market = Market.find(params[:market_id])
    @vendor = Vendor.new
  end

  def create
    @market = Market.find(params[:market_id])
    @vendor = Vendor.new(vendor_params)
    @vendor.market_id = params[:market_id]
    if @vendor.save
      redirect_to market_path(@market)
    else
      render :new
    end
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

   def destroy
    @market = Market.find(params[:market_id])
    @vendor = Vendor.find(params[:id])
    @vendor.destroy

    redirect_to market_path(@market.id)
   end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :num_employees)
  end
end
