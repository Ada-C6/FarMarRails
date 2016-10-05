class VendorController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def create
    @vendor = Vendor.create(vendor_params)

    redirect_to root_path
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

    if @vendor.update(vendor_params)
      redirect_to vendor_path
    else
      render :edit
    end
  end

  def destroy
    @vendor = Vendor.find(params[:id]).destroy
  end

end
