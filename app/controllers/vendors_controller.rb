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
    @vendor.market_id = params[:vendor][:market_id]

    @vendor.save

    redirect_to action: "index"

  end

  def show
    @vendor = Vendor.find(params[:id].to_i)
  end

  def edit
    @vendor = Vendor.find(params[:id].to_i)
  end

  def update
    @vendor = Vendor.find(params[:id].to_i)

    @vendor.name = params[:vendor][:name]
    @vendor.employee_num = params[:vendor][:employee_num]
    @vendor.market_id = params[:vendor][:market_id]

    @vendor.save

    redirect_to action: "index"
  end

  def destroy
    @vendor = Vendor.destroy(params[:id].to_i)
    redirect_to action: "index"
  end

  private
   def post_params
     params.require(:task).permit(:title, :description)
   end
end
