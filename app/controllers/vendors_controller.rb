class VendorsController < ApplicationController
  def new
    @myvendor = Vendor.new
    @vendor_method = :post
    @vendor_path = vendors_create_path
  end

  def create
    @myvendor = Vendor.new
    @myvendor.name = params[:vendor][:name]
    @myvendor.no_employees = params[:vendor][:no_employees]
    @myvendor.market_id = params[:id]
    @myvendor.save
  end

  def update
    Vendor.update(params[:id], :name => params[:vendor][:name],
                              :no_employees => params[:vendor][:no_employees])
    @myvendor = Vendor.find(params[:id])
  end

  def edit
    @myvendor = Vendor.find(params[:id])
    @vendor_method = :put
    @vendor_path = vendors_update_path(@myvendor.id)
    if @myvendor == nil
      render :file => 'public/404.html',
          :status => :not_found
    end
  end

  def destroy
    @myvendor = Vendor.find(params[:id])
    @mymarket = @myvendor.market_id
    @myvendor.destroy
    redirect_to show_market_path(@mymarket)
  end

  def show
  end

  def index
  end
end
