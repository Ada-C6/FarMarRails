class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def new

  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end




end
