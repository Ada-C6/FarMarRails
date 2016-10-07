class SaleController < ApplicationController
  require 'path_check.rb'
  include PathCheck

  def index
    if product_sale?
      product = Product.find(params[:product_id])
      @sales = Sale.where(:product_id => product.id)
    else vendor_sale?
      vendor = Vendor.find(params[:vendor_id])
      @sales = Sale.where(:vendor_id => vendor.id)
    end
  end

  def create
    @sale = Sale.create(sale_params)
    redirect_to vendor_sale_index_path
  end

  def new
    @sale = Sale.new
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def update
    @sale = Sale.find(params[:id])

    if @sale.update(sale_params)
      redirect_to vendor_sale_index_path
    else
      render :edit
    end
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def destroy
    @sale = Sale.find(params[:id]).destroy
    redirect_to vendor_sale_index_path
  end

  ####### STRONG PARAMS #########

  private

  def sale_params
    params.require(:sale).permit(:name, :vendor_id)
  end


end
