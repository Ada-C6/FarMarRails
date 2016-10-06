class SalesController < ApplicationController
  def index
  end

  def show
    @vendor = Vendor.find(current_user.id)
    @time_period = params[:period]
  end

  def new
    @sale = Sale.new
    @vendor = Vendor.find(current_user.id)
  end

  def create
    @sale = Sale.create(amount: (Float(params[:sale][:amount])*100).round, vendor_id: current_user.id.to_i, product_id: params[:sale][:product_id].to_i, purchase_time: DateTime.now)
    redirect_to sales_show_path(:period => :all)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
