class VendorsController < ApplicationController

  def index
    @vendors_all = Vendor.all.order(:name)
    # a_e = ["a", "b", "c", "d", "e"]
    # @vendors_a_e = Vendor.by_letter(a_e)
  end

  def show
    id = params[:id]
    @vendor = Vendor.find(id)
    @products = @vendor.products
    @sales = @vendor.sales #sales(@products)
    @vendor_market_object = Market.find(@vendor.market_id)
    @vendor_market = @vendor_market_object.name
    @full_address = @vendor_market_object.full_address
    @sales_total = @vendor.sales_total(@sales)
    @month_sales = @vendor.sales_current_month
    @current_month_total = @vendor.current_month_total

    if !(@sales.empty?)
      @attribute_keys = @sales.first.attributes.keys #doesn't work if no sales
    end
  end

  def destroy
      @market = Market.find(params[:market_id])
      @vendor = Vendor.find(params[:id])
      @vendor.destroy
      redirect_to market_path(@market.id)
  end

  def new
    @market = Market.find(params[:market_id])
    @vendor = @market.vendors.new
  end

  def create
    @market = Market.find(params[:market_id])
    @vendor = @market.vendors.new(vendor_params)
    if @vendor.save
      redirect_to market_path(@market.id)
    else
      render :new
    end
  end

  def edit
    @vendor = Vendor.find(params[:id])
    @market = Market.find(params[:market_id])
  end

  def update
    @market = Market.find(params[:market_id])
    @vendor = Vendor.find(params[:id])
      if @vendor.update(vendor_params)
        redirect_to market_path(@market.id)
      else
      render :edit
    end
  end

  private
  def vendor_params
    params.require(:vendor).permit(:name, :number_of_employees,
    :markets => [:name, :address, :city, :county, :state, :zip])
  end
end
