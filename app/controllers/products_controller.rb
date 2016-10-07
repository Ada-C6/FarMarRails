class ProductsController < ApplicationController
    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
        # @product[:vendor_id] = @product.vendor.id
        if @product.update(product_params)
            redirect_to vendor_path(@product.vendor)
        else
            render :edit
        end
    end


    private

    def product_params
        params.require(:product).permit(:name, :vendor_id)
    end
end
