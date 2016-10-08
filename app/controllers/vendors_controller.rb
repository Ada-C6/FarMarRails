class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
    @products = @vendor.products
  end

  def view_products
    @vendor = Vendor.find(params[:id])
    @products = @vendor.products
  end

  # This is double ^^ revisit routes

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vend_params)
    if @vendor.save
      # SAVED SUCCESSFULLY
    else
      # DID NOT SAVE
      render :new
    end

    redirect_to vendors_path
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    if @vendor.update(vend_params)
      # SUCCESS
      redirect_to vendors_path
    else
      # NOPE
      render :edit
    end
  end

  def destroy
    Vendor.find(params[:id]).destroy
    redirect_to vendors_path
  end

  private

  def vend_params
    params.require(:vendor).permit(:ref_id, :name, :num_employees, :market_id)
  end
end
