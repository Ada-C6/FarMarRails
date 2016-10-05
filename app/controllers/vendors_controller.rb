class VendorsController < ApplicationController
  def find_all
    @vendors = Vendor.all
    @products = Product.all
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
    @product_list = []
    @products.each do |product|
      if product.vendor_id == @vendor.id
      @product_list << product
      end
    end
    return @product_list
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
