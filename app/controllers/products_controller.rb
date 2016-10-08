class ProductsController < ApplicationController
  def new
    vendor_id = params[:vendor_id]
    @vendor = Vendor.find(vendor_id)
    @vendor_product = @vendor.products.build
  end

  def create
    vendor_id = params[:vendor_id]
    vendor = Vendor.find(vendor_id)
    @vendor_product = vendor.products.create(vendor_product_params)

    redirect_to vendor_path(vendor_id)
  end

  def show
    id = params[:id]
    @vendor_product = Product.find(id)
  end

  def edit
    id = params[:id]
    @vendor_product = Product.find(id)
=begin
  @vendor = Vendor.find(params[:vendor_id])
  @product = Product.find(params[:id])
=end

  end

  def update
    @vendor_product = Product.find(params[:id])
    if @vendor_product.update(vendor_product_params)
      redirect_to vendor_path(params[:vendor_id])
    else
      render :edit
    end
=begin
    @product = Product.find(params[:id])
    @vendor = Vendor.find(params[:vendor_id])
    @product.vendor_id = @vendor.id
    if @vendor_product.update(vendor_product_params)
      redirect_to vendor_path(params[@vendor.id])
    else
      render :edit
    end
=end
  end

  def destroy
    @vendor_product = Product.find(params[:id])
    if @vendor_product.destroy
      redirect_to vendor_path(params[:vendor_id])
    end
  end

  private

  def  vendor_product_params
    params.require(:product).permit(:name, :vendor_id)
  end
end
