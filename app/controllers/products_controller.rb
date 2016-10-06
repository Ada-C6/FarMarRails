class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to vendor_path
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id]).destroy
    redirect_to vendor_path
  end

  def edit  # Will give the form, like new
    @product = Product.find(params[:id])
  end

  def update # Actually do the update, like create
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to vendor_path
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, {:vendors => [:id, :market_id, :name, :employee_number]})
  end
end
