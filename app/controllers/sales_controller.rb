class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def show
    find
  end

  def new
    @sale = Sale.new

    url = request.referrer
    numbers = url.scan(/\d+/)
    @id = numbers.last.to_i
  end

  def create
    @sale = Sale.new

    @sale.amount = params[:sale][:amount]
    @sale.purchase_time = params[:sale][:purchase_time]
    @sale.vendor_id = params[:sale][:vendor_id]
    @sale.product_id = params[:sale][:product_id]

    @sale.save

    redirect_to controller: 'vendors', action: 'show_sales', id: @sale.vendor.id
  end

  def edit
    find
  end

  def update
    find

    @sale.amount = params[:sale][:amount]
    @sale.purchase_time = params[:sale][:purchase_time]
    @sale.vendor_id = params[:sale][:vendor_id]
    @sale.product_id = params[:sale][:product_id]
    @sale.save

    redirect_to controller: 'vendors', action: 'show_sales', id: @sale.vendor.id
  end

  def destroy
    find

    @sale.destroy

    redirect_to controller: 'vendors', action: 'show_sales', id: @sale.vendor.id
  end

  private
  def find
    @sale = Sale.find(params[:id].to_i)
  end
end
