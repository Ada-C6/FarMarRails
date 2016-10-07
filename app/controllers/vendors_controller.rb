class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
    @market = Market.find(@vendor.market_id)
    @products = Product.where(vendor_id: params[:id])
    @sales = Sale.where(vendor_id: params[:id])


  end

  def new
    @market = Market.find(params[:market_id])
    @vendor = @market.vendors.new
  end

  def create
    @market = Market.find(params[:market_id])
    @vendor = @market.vendors.new(vendor_params)
    if @vendor.save
      redirect_to market_path(@vendor.market)
    else
      render :new
    end
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    if @vendor.update(vendor_params)
        redirect_to markets_path(@vendor.market)
    else
      render :edit
    end
  end

  def destroy
    Vendor.find(params[:id]).destroy
    redirect_to market_vendors_path
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :vendor_id, :num_employees)
  end


end
