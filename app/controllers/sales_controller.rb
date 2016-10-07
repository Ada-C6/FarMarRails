class SalesController < ApplicationController

  def index
    @sales = Sale.all
  end

  def show
    @sale = Sale.find(params[:id])
    @vendor= Vendor.find(@sale.vendor_id)

  end

end
