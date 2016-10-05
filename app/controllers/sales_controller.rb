class SalesController < ApplicationController
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

  def show
  end

  def index
    @sales = Sale.where(vendor_id:params[:id])
  end
end
