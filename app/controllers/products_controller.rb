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
  end



  def destroy
  end

  def show
  end

  def index
  end
end
