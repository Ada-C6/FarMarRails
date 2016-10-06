class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end


  def create
    @params = params
    @vendor = Vendor.new
    @vendor.name = params[:vendor][:name]
    @vendor.employee_num = params[:vendor][:employee_num]
    @vendor.name = params[:vendor][:name]
    @vendor.market_id = params[:vendor][:market_id]

    @vendor.save

    redirect_to action: "index"
    # @path = "update"

  end

  def show
  end

  def edit
  end

  def update
  end




  def destory
  end
end
