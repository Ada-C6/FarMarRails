class ProductsController < ApplicationController
    def edit
        @product = Product.find(params[:id])
    end
end
