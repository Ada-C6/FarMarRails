class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def show
  end

  def edit
  end

  def create
    @params = params
    @vendor = Vendor.new
    @vendor.name = params[:vendor][:name]
    @vendor.employees = params[:vendor][:employees]
    @vendor.market_id = params[:vendor][:market_id]

    if(@vendor.save)
        # Saved successfully; go to the index
        redirect_to :action => "index"
    else
        # Validation failed; show the "new" form again...
        render :action => :new
    end
  end

  def update
  end

  def destroy
  end
end
