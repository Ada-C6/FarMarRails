class SalesController < ApplicationController
  def index
    @vendor = Vendor.find(params[:id])
  end

  def show
  end

  def new
    @sale = Sale.new
  end

  def create
    # @sale = Sale.new(amount: params[:sale][:amount], purchase_time: params[:sale][:purchase_time], vendor_id: params[:vendor_id])

    # @sale.save

    # redirect_to index_products_url(id: params[:vendor_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
