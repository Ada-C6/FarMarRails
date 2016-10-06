class ProductsController < ApplicationController
  def new
    @product = Product.new
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

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @vendor = Vendor.find(params[:vendor_id])
    if @product.update(product_params)
      redirect_to vendor_path(@vendor.id)
    else
      render :edit
    end
  end

  def destroy
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.find(params[:id]).destroy
    redirect_to vendor_path(@vendor.id)
  end

# ---- PRIVATE METHODS ----

  private

  def product_params
    params.require(:product).permit(:name, :vendor_id)
  end
end
