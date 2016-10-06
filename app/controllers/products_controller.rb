class ProductsController < ApplicationController

  def index
    @vendor = Vendor.find(params[:vendor_id])
    @product_list = @vendor.products
  end

  def show
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.find(params[:id])
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.new
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.new(product_params)
    @product.vendor_id = params[:vendor_id]
    if @product.save
      redirect_to vendor_products_path
    else
      render :new
    end
  end

  def edit
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      @product.vendor_id = params[:vendor_id]
      redirect_to vendor_products_path
    else
      render :edit
    end
  end
end


private
def product_params
  params.require(:product).permit(:name)
end
