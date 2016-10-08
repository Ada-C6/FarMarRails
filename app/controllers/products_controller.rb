class ProductsController < ApplicationController

  def index
    @vendor = Vendor.find(params[:vendor_id])
    @products = @vendor.products
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @product = @vendor.products.build
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @product = @vendor.products.new(prod_params)
    if @product.save
      # SAVED SUCCESSFULLY
      redirect_to vendor_products_path
    else
      # DID NOT SAVE
      puts @product.errors.messages
      render :new
    end
  end

  def edit
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.find(params[:id])
    if @product.update(prod_params)
      # SUCCESS
      redirect_to vendor_products_path
    else
      # NOPE
      render :edit
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to vendor_products_path
  end

  private

  def prod_params
    params.require(:product).permit(:ref_id, :name, :vendor_id)
  end

end
