class VendorsController < ApplicationController

    def index
        @vendors = Vendor.all
    end

    def show
        @vendor = Vendor.find(params[:id])
        @products = @vendor.products
    end

    def new
      @vendor = Vendor.new
      @market_id = params[:market_id]
    end

    def edit
      @vendor = Vendor.find(params[:id])
    end

    def create
      @market_id = params[:market_id]
      @vendor = Vendor.new(vendor_params)
      @vendor[:market_id] = @market_id
      if @vendor.save
        redirect_to market_path(@market_id)
      else
        render :new
      end
    end

    # def update
    #
    # end

    def destroy
      Vendor.find(params[:id]).destroy
      redirect_to market_path
    end

    def confirm_deletion
      @vendor = vendor.find(params[:id])
    end

  private
    def vendor_params
      params.require(:vendor).permit(:name, :num_employees)
    end

end
