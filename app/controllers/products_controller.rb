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
    @product = Product.new
  end

  def create
    @params = params
    @product = Product.new
    @product.name = params[:product][:name]
    @product.vendor_id = params[:product][:vendor_id]
    @product.save

    redirect_to show_vendor_path(@product.vendor_id)
  end

  def edit
    show
  end

  def update
    @params = params
    @product = find_product
    @product.name = params[:product][:name]
    @product.vendor_id = params[:product][:vendor_id]
    @vendor.save

    redirect_to show_vendor_path(@product.vendor_id)
  end

  def destroy
    @product = find_product
    @product.destroy
    redirect_to vendors_path
  end
end

  private
  def params
  params.require(:product).permit(:name, :vendor_id)
  end
