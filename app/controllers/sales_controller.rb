class SalesController < ApplicationController
  def new
    @sale = Sale.new
    @method = :post
    @path = save_sale_path(params[:id])
  end

  def create
    @sale = Sale.new
    @sale.amount = Sale.make_into_cents(params[:sale][:amount])
    @sale.purchase_time = Time.now
    @sale.product_id = params[:id]
    # this finds the product by its ID, then grabs that product's vendor and its ID, and gives the Sale that Vendor ID.
    @sale.vendor_id = Product.find(params[:id]).vendor.id
    @sale.save
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

  def index
    vendor_id = params[:id]
    @sales = Sale.where(vendor_id: vendor_id)
    @sale_total = Sale.total(@sales).to_f/100
    @month_sales = Sale.monthfind(@sales)
    @month_sale_total = Sale.total(@month_sales).to_f/100
  end
end
