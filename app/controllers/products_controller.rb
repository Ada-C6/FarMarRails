class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @vendor = Vendor.find(params[:vendor_id])
    @product.vendor_id = @vendor.id
    if @product.save
      puts "REDIRECT ME: #{@vendor.id}"
      redirect_to vendor_path(@vendor.id)
    else
      puts "RENDER"
      render :new
    end
  end

  def edit
    
  end

# ---- PRIVATE METHODS ----

  private

  def product_params
    params.require(:product).permit(:name, :vendor_id)
  end
end
