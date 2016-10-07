class SalesController < ApplicationController
  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    @product = Product.find(params[:product_id])
    @sale.product_id = @product.id
    @vendor = Vendor.find(params[:vendor_id])
    @sale.vendor_id = @vendor.id
    @sale.purchase_time = Time.now
    if @sale.save
      redirect_to vendor_path(@vendor)
    else
      render :new
    end
  end

  # ---- PRIVATE METHODS ----

    private

    def sale_params
      params.require(:sale).permit(:amount, :purchase_time, :vendor_id, :product_id)
    end

end
