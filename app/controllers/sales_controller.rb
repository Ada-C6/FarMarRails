class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def new
    @product = Product.find(params[:vendor_id])
    @sale = @product.sales.build
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @product = @vendor.products.find(params[:product_id])
    @sale = @product.sales.new(sale_params)
    @sale.vendor = @vendor
    @sale.purchase_time = Time.now
    if @sale.valid?
      @sale.amount *= 100
    end
    if @sale.save
      redirect_to vendor_path(@vendor.id)
    else
      render :new
    end
  end

  private

  def sale_params
    params.require(:sale).permit(:amount, :purchase_time,
      :product => [:name])
  end
end
