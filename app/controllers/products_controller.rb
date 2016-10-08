class ProductsController < ApplicationController

  def index
    @product = Product.all

    @vendor = Vendor.find(params[:vendor_id])
    @individual_products = @vendor.products
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new
    @product.name = params[:product][:name]
    @product.vendor_id = params[:vendor_id]
    if @product.save
      redirect_to vendor_products_path(params[:vendor_id])
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @vendor = params[:vendor_id]
  end

  def update
  @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to vendor_products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id]).destroy
    redirect_to vendor_products_path
  end

  private

  def product_params
    params.require(:product).permit(:id, :name, :vendor_id)
  end
end
