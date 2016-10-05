class ProductsController < ApplicationController
  def new
    @product = Product.new
    @method = :post
    @path = "create"
  end

  def create
    @product = Product.new
    @product.name = params[:product][:name]
    @product.vendor_id = params[:id]

    @product.save
  end

  def edit
    @product = Product.find(params[:id])
    @method = :put
    @path = update_product_path(@product.id)
  end

  def update
    Product.update(params[:id], name: params[:product][:name])
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    vendor = @product.vendor_id
    @product.destroy
    redirect_to show_vendor_path(vendor)
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
  end
end
