class VendorsController < ApplicationController
# As a vendor, I can create, edit, or delete my Products
# As a vendor, I can create a Sale for one of my Products
# As a vendor, I can see a list of my Sales
# As a vendor, I can see a total of all of my Sales
# As a vendor, I can see a list of my Sales for the current month
# As a vendor, I can see a total of my Sales for the current month

  def index
    @all_vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def new
    @market = Market.find(params[:market_id])
    @vendor = @market.vendors.new
  end

  def edit
    @market = Market.find(params[:market_id])
    @vendor = @market.vendors.find(params[:id])
  end

  def create
    @market = Market.find(params[:market_id])
    @vendor = @market.vendors.build(vendor_params)

    if @vendor.save
      redirect_to market_path(@market)
    else
      render :new
    end
  end

  def update
    @market = Market.find(params[:market_id])
    @vendor = @market.vendors.find(params[:id])

    if @vendor.update(vendor_params)
      redirect_to market_path(@market)
    else
      render :edit
    end
  end

  def destroy
    market = Market.find(params[:market_id])
    vendor = market.vendors.find(params[:id])
    vendor.destroy

    redirect_to market_path(market)
  end

  private
    def vendor_params
      params.require(:vendor).permit(:name, :no_of_employees)
    end

end
