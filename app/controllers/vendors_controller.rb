class VendorsController < ApplicationController
  def index
    @vendor = Vendor.find(current_user.id)
  end

  def show
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
