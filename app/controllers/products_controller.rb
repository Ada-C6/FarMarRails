class ProductsController < ApplicationController
  def find_all
    @products = Product.all
    @sales = Sale.all
  end

  def find_product
    return Product.find(params[:id].to_i)
  end

  def index
    find_all
  end

  def show
    find_all
    @product = find_product
    @vendor = Vendor.find(@product.vendor_id).name
    @sale_list = []
    @sales.each do |sale|
      if sale.product_id == @product.id
      @sale_list << sale
      end
    end
    return @sale_list
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
  params.require(:product).permit(:name, :vendor_id)
  end
