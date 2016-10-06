class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
  end

  def create
  end

  def show
    @myproducts = Product.find(params[:id].to_i)
  end

  def edit
    @myproducts = Product.find(params[:id].to_i)
  end

  def destroy
  end
end
