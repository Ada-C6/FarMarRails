class ProductsController < ApplicationController

  def index
    @all_products_by_vendor = Product.where(vendor_id: params[:vendor_id])
    @vendor = Vendor.find(params[:vendor_id])
  end

  def new
    @product = Product.new
    @vendor = Vendor.find(params[:vendor_id])
  end


  def create
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.new(product_params)
    @vendor.products << @product

    if @product.save
      # saved successfully
      redirect_to vendor_products_path
    else
      # did not save
      render :new
    end
  end


  def edit
    @product = Product.find(params[:id])
    @vendor = Vendor.find(params[:vendor_id])
  end

  def update
    @product = Product.find(params[:id])
    @vendor = Vendor.find(params[:vendor_id])

    if @product.update(product_params)
      # saved successfully
      redirect_to vendor_products_path
    else
      # did not save
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])

    @product.destroy
    redirect_to vendor_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name)
  end

end
