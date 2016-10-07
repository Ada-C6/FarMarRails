class VendorsController < ApplicationController

  def findVendor
    return Vendor.find(params[:id].to_i)
  end

  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def show
    @vendor = findVendor
  end

  def edit
    @vendor = findVendor

    if @vendor == nil
          render :file => 'public/404.html',
              :status => :not_found
    end
  end

  def update
    @vendor = findVendor

    if @vendor == nil
          render :file => 'public/404.html',
              :status => :not_found
    end

    if @vendor.update(name: params[:vendor][:name], employees: params[:vendor][:employees], market_id: params[:vendor][:market_id])
      redirect_to action: "show"
    else
      render 'edit'
    end
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

  def destroy
    @vendor = findVendor
    @vendor.destroy

    redirect_to action: "index"
  end
  # 
  # def total_sales
  #   @vendor = findVendor
  #   totalsales = 0.0
  #
  #   if @vendor.sales == nil
  #     return totalsales
  #   else
  #     @vendor.sales.each do |sale|
  #       totalsales += sale.amount / 100.0
  #     end
  #   end
  #
  #   return totalsales
  # end

end
