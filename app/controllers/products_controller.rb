class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @vendor= Vendor.find(@product.vendor_id)

  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @product = @vendor.products.new
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @product = @vendor.products.new(product_params)
    if @product.save
      redirect_to vendor_path(@product.vendor)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to vendor_path(@product.vendor)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to vendor_path(@product.vendor)
  end

  private

  def product_params
    params.require(:product).permit(:name, :market_id, :num_employees)
  end

end
