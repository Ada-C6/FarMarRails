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
  end

  def update
  end

  def destroy
  end
end
