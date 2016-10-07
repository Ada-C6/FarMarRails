class ProductsController < ApplicationController
  def index
    @vendor = Vendor.find(params[:id])
    # @products = Product.find_by(vendor_id: params[:id])

    @products = []
    @vendor.product_ids.each do | product_id |
      @products << Product.find(product_id)
    end
  end

  def show
    @product = Product.find(params[:id])
    @vendor = @product.vendor
  end

  def new
    @product = Product.new

  end

  def create
    @product = Product.new(name: params[:product][:name], vendor_id: params[:vendor_id])

    @product.save

    redirect_to index_products_url(id: params[:vendor_id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.update(params[:id], {name: params[:product][:name], vendor_id: params[:vendor_id]})

    redirect_to index_products_url(id: params[:vendor_id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to index_products_url(id: @product.vendor.id)
  end
end
