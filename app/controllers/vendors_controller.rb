class VendorsController < ApplicationController
  def find_all
    @vendors = Vendor.all
    @products = Product.all
    @sales = Sale.all
  end

  def find_vendor
    return Vendor.find(params[:id].to_i)
  end

  def index
    find_all
  end

  def show
    find_all
    @vendor = find_vendor
    @market = Market.find(@vendor.market_id).name

    @total_sales = 0
    @sales.each do |sale|
      if sale.vendor_id == @vendor.id
        @total_sales += sale.amount
      end
    end
    @total_sales

    @product_list = []
    @products.each do |product|
      if product.vendor_id == @vendor.id
      @product_list << product
      end
    end
    @product_list
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
  params.require(:vendor).permit(:name, :num_employees, :market_id)
  end
