class SalesController < ApplicationController
  def find_all
    @sales = Sale.all
  end

  def find_sale
    return Sale.find(params[:id].to_i)
  end

  def index
    find_all
  end

  def show
    @sale = find_sale
    @vendor = Vendor.find(@sale.vendor_id).name
    @product = Product.find(@sale.product_id).name
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

  private
  def params
  params.require(:sale).permit(:amount, :purchase_time, :vemdor_id, :product_id)
  end
