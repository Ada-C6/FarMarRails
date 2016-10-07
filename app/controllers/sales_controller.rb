class SalesController < ApplicationController
  def index
    @vendor = Vendor.find(params[:vendor_id])
    @sales = @vendor.sales

    @current_sales = @sales.where(purchase_time: (1.month.ago)...DateTime.now)
    # current sales is supposed to be "this month", and what it's currently doing is the sales from a month ago up to now (so not restricted on THIS month)
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @sale = Sale.new

    @sale.purchase_time = DateTime.now

    # @todo - refactor opportunity; move this logic into Sale model?
    @products_selection_array = []
    @vendor.products.each do |product|
    	@products_selection_array << [product.name, product.id]
    end
  end # new

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @sale = Sale.new(sale_params)

    @sale.vendor_id = @vendor.id

    if @sale.save
      redirect_to market_vendor_sales_path(market_id: @vendor.market_id, vendor_id: @vendor.id)
    else
      render :new
    end
  end # create

  private

  def sale_params
    params.require(:sale).permit(:product_id, :amount, :purchase_time)
  end
end
