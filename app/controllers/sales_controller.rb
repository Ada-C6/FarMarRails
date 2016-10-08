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
    @product = Product.new
  end

  def create
    @params = params
    @sale = Sale.new
    @sale.name = params[:sale][:amount]
    @sale.purchase_time = params[:sale][:purchase_time]
    @sale.vendor_id = params[:sale][:vendor_id]
    @sale.product_id = params[:sale][:product_id]
    @sale.save

    redirect_to show_vendor_path(@sale.vendor_id)
  end

  def edit
    show
  end

  def update
    @params = params
    @sale = find_sale
    @sale.name = params[:sale][:amount]
    @sale.purchase_time = params[:sale][:purchase_time]
    @sale.vendor_id = params[:sale][:vendor_id]
    @sale.product_id = params[:sale][:product_id]
    @sale.save

    redirect_to show_vendor_path(@sale.vendor_id)
  end

  def destroy
    @product = find_product
    @product.destroy
    redirect_to vendors_path
  end
end

  private
  def params
  params.require(:sale).permit(:amount, :purchase_time, :vendor_id, :product_id)
  end
