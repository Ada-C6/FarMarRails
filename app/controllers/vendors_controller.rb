class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)
    @market = Market.find(params[:market_id])
    @vendor.market_id = @market.id
    if @vendor.save
      # Redirect to the show page for the
      # market with the proper id -- because
      # vendors never create themselves, but
      # markets do create vendors this seems
      # like the best redirect
      redirect_to market_path(@market)
    else
      render :new
    end
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    @market = Market.find(@vendor.market_id)
    if @vendor.update(vendor_params)
      # Since a Vendor never updates itself,
      # redirect to the market page
        redirect_to market_path(@market)
    else
      render :edit
    end
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    # Find the market that the Vendor belongs to
    # through market_id
    @market = Market.find(@vendor.market_id)
    @vendor.destroy
    # Redirect to show page for the market
    # with the proper id -- because vendors
    # never delete themselves, this seems
    # like the best redirect
    redirect_to market_path(@market)
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :num_employees, :market_id)
  end
end
