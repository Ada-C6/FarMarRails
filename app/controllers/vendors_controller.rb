class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
    # TODO
    # make products for display
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      redirect_to vendors_path
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
      redirect_to markets_show_vendors_path
    else
      render :edit
    end
  end

  def destroy
    Vendor.find(params[:id]).destroy
    redirect_to vendors_path
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :market_id, :num_employees)
  end





end
