class SalesController < ApplicationController
    def new
        @sale = Sale.new
        @vendor_id = params[:vendor_id]
        @product_id = params[:product_id]
        @vendor = Vendor.find(@vendor_id)
        @product = Product.find(@product_id)
    end

    def create
        @vendor_id = params[:vendor_id]
        @product_id = params[:product_id]
        @sale = Sale.new(product_params)
        @sale[:vendor_id] = @vendor_id
        @sale[:product_id] = @product_id
        @sale[:purchase_time] = Time.now.utc
        if @sale.save  # successful
            redirect_to vendor_path(@sale.vendor)
        else  # unsuccessful, return to form
            render :new
        end
    end


    private

    def product_params
        params.require(:sale).permit(:amount)
    end
end
