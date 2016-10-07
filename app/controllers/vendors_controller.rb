class VendorsController < ApplicationController
  def index
    @vendor = Vendor.find(params[:id])

    @products = []
    @vendor.product_ids.each do | product_id |
      @products << Product.find(product_id)
    end

    @revenue = @vendor.total_revenue

  end

  def show
    @vendor = Vendor.find(params[:id])
    # @products = Product.find_by(vendor_id: params[:id])

    @products = []
    @vendor.product_ids.each do | product_id |
      @products << Product.find(product_id)
    end

  end

  def new
    @vendor = Vendor.new

  end

  def create
    @vendor = Vendor.new(name: params[:vendor][:name], no_employees: params[:vendor][:no_employees], market_id: params[:market_id])

    @vendor.save

    redirect_to show_markets_url(id: params[:market_id], type: "market")
  end

  def edit
    @vendor = Vendor.find(params[:id])

  end

  def update
    @vendor = Vendor.update(params[:id], {name: params[:vendor][:name], no_employees: params[:vendor][:no_employees], market_id: params[:market_id]})

    redirect_to show_markets_url(id: params[:market_id], type: "market")
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy

    redirect_to show_markets_url(id: @vendor.market.id, type: "market")
  end
end
