class VendorsController < ApplicationController
  def index
  @vendors = Vendor.all
  end

  def show
    @myvendor = Vendor.find(params[:id].to_i)
  end

  def new
  end

  def create
  end

  def edit
    @myvendor = Vendor.find(params[:id])
  end

  def update
    @myvendor = Vendor.find(params[:id])
    @myvendor.name = params[:vendor][:name]
    @myvendor.num_employees = params[:vendor][:num_employees]
    @myvendor.save

    redirect_to action: 'index'
  end

  def destroy
  end
end
