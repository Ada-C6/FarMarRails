class VendorsController < ApplicationController
  def find_all
    @vendors = Vendor.all
    @products = Product.all
    @sales = Sale.all
  end

  def find_vendor
    return Vendor.find(params[:id].to_i)
  end

  def index
    find_all
  end

  def show
    find_all
    @vendor = find_vendor

    if @vendor.market_id == 0
      @market = "This vendor has no Market"
    else
      @market = Market.find(@vendor.market_id).name
    end

    @total_sales = 0
    @sales.each do |sale|
      if sale.vendor_id == @vendor.id
        @total_sales += sale.amount
      end
    end
    @total_sales

    @product_list = []
    @products.each do |product|
      if product.vendor_id == @vendor.id
      @product_list << product
      end
    end
    @product_list
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @params = params
    @vendor = Vendor.new
    @vendor.name = params[:vendor][:name]
    @vendor.num_employees = params[:vendor][:num_employees]
    @vendor.market_id = params[:vendor][:market_id]
    @vendor.save

    redirect_to show_vendor_path(@vendor.id)
  end

  def edit
    show
  end

  def update
    @params = params
    @market = find_market
    @vendor.name = params[:vendor][:name]
    @vendor.num_employees = params[:vendor][:num_employees]
    @vendor.market_id = params[:vendor][:market_id]
    @vendor.save

    redirect_to show_vendor_path(@vendor.id)
  end

  def destroy
    @vendor = find_vendor
    @vendor.destroy
    redirect_to vendors_path
  end
end

  private
  def params
  params.require(:vendor).permit(:name, :num_employees, :market_id)
  end
