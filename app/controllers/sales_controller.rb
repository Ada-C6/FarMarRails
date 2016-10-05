class SalesController < ApplicationController
  def new
    @sale = Sale.new
    @method = :post
    @path = save_sale_path(params[:id])
  end

  def create
    @sale = Sale.new
    @sale.amount = params[:sale][:amount]
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
    @sales = Sale.where(vendor_id:params[:id])
  end
end
