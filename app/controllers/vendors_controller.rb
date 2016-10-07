class VendorsController < ApplicationController
  def index
    @vendor_list = Vendor.all
  end

  def show
    this_vendor = Integer(params[:id])
    @this_vendor = Vendor.find(this_vendor)
  end

  def new
    this_market = Market.find(params[:id]).id
    @new_vendor = Vendor.new(market_id: this_market)
  end

  def create
    id = Integer(params[:id])
    @new_vendor = Vendor.new(market_id: id)
    @new_vendor.save
    if @new_vendor.update(vendor_params)
      redirect_to market_view_path
    else
      render :edit
    end
  end

  def edit
    @this_vendor = Vendor.find(params[:id])
  end

  def update
    @this_vendor = Vendor.find(params[:id])

    if @this_vendor.update(vendor_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  # having trouble redirting once the entry is edited/deleted

  def destroy
    @this_vendor = Vendor.find(params[:id]).destroy
    redirect_to root_path(:id)
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :employees)
  end
end
