class ProductsController < ApplicationController
    def new
        @product = Product.new
        @vendor_id = params[:vendor_id]
    end

    def create
        @vendor_id = params[:vendor_id]
        @product = Product.new(product_params)
        @product[:vendor_id] = @vendor_id
        if @product.save  # successful
            redirect_to vendor_path(@product.vendor)
        else  # unsuccessful, return to form
            render :new
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to vendor_path(@product.vendor)
        else
            render :edit
        end
    end

    # def destroy
    #     @product = Product.find(params[:id])
    #     @product.destroy
    #     redirect_to vendor_path(@product.vendor)
    # end


    private

    def product_params
        params.require(:product).permit(:name)
    end
end
