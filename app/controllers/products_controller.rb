class ProductsController < ApplicationController
  def new
    @vendor = Vendor.find(params[:vendor_id])
    @product = @vendor.products.new
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @product = @vendor.products.new(product_params)

    if @product.save(product_params)
      redirect_to market_vendor_path(market_id: @vendor.market_id, id: @vendor.id)
    else
      render :edit
    end
  end

  def edit
  end

  def update
  end

  private

  def product_params
    params.require(:product).permit(:name)
  end
end
