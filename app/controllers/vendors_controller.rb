class VendorsController < ApplicationController
  def index
    @vendor_list = Vendor.all
  end

  def show
    this_vendor = Integer(params[:id])
    @this_vendor = Vendor.find(this_vendor)
  end

  def show_products
    this_vendor = Integer(params[:id])
    @this_vendors_products = Product.where(vendor_id: this_vendor)
  end

  def show_sales
    this_vendor = Integer(params[:id])
    @this_vendors_sales = Sale.where(vendor_id: this_vendor)
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
      redirect_to farmers_market_views_path
    else
      render :edit
    end
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :employees)
  end
end
