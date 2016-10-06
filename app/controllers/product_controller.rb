class ProductController < ApplicationController
  def index
    vendor = Vendor.find(params[:vendor_id])
    @products = Product.where(:vendor_id => vendor.id)
  end

  def create
    @product = product.create(product_params)

    redirect_to vendor_product_index_path
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id]).destroy
    redirect_to vendor_product_index_path
  end

end
