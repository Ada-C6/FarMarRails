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

  def destroy
    @market = Market.find(params[:market_id])
    vendor = @market.vendors.find(params[:id])
    vendor.destroy

    redirect_to market_path(@market)
  end


end
