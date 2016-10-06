class ProductsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @product = Product.new
    @method = 'post'
    @path = products_create_path
  end

  def create
    Product.create(name: params[:product][:name], vendor_id: current_user.id)
    redirect_to controller: "products", action: "index"
  end

  def edit
    @product = Product.find(params[:id])
    @method = 'put'
    @path = products_update_path
  end

  def update
    @product = Product.find(params[:id])
    @product.update(name: params[:product][:name])
    redirect_to controller: "products", action: "index"
  end

  # Deletes a product and all its associated sales

  def destroy
    product = Product.find(params[:id])

    product.sales.each do |sale|
      sale.destroy
    end

    product.delete

    redirect_to controller: "products", action: "index"
  end
end
