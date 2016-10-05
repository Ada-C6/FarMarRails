class ProductsController < ApplicationController
  def new
    @product = Product.new
    @method = :post
    @path = "create"
  end

  def create
    @product = Product.new
    # @method = :post
    # @path = "show"
    @product.name = params[:product][:name]
    @product.vendor_id = params[:id]

    @product.save
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

  def index
  end
end
