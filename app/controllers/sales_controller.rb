class SalesController < ApplicationController
  def index
  end

  def new
    @mysale=Sale.new
    @sale_method = :post
    @sale_path = sales_create_path(params[:vendor_id],params[:product_id])
  end

  def create
    @params=params
    @mysale = Sale.new
    @mysale.amount = params[:sale][:amount].to_i
    @mysale.purchase_time = Time.now
    @mysale.vendor_id = params[:vendor_id]
    @mysale.product_id = params[:product_id]
    @mysale.save
    redirect_to vendors_show_path(@mysale.vendor_id)
  end

  def show
  end

  def edit
  end

  def destroy
  end
end
