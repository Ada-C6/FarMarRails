class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @product = @vendor.products.build
  end

  def create
    @product = Product.new(product_params)
    @vendor = Vendor.find(params[:vendor_id])
    @product.vendor_id = @vendor.id
    if @product.save
      redirect_to vendor_path(@vendor.id)
    else
      render :new
    end
  end

  def destroy
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.find(params[:id]).destroy
    redirect_to vendor_path(@vendor.id)
  end

  def edit  # Will give the form, like new
    @product = Product.find(params[:id])
    @vendor = Vendor.find(params[:vendor_id])
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
    params.require(:product).permit(:name,
      :vendors => [:name, :employee_number, :market_id])
  end
end
