class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def new
    @product = Product.new
  end


  def create
    @params = params

    @product = Product.new
    @product.name = params[:product][:name]
    @product.vendor_id = params[:product][:id].to_i

    @product.save

    redirect_to action: 'show', id:@product.vendor_id

  end

  def show
    @vendor = Vendor.find(params[:id].to_i)
    @products = Product.all
    @markets = Market.all
  end

  def edit
    @product = Product.find(params[:id].to_i)
    @vendor = Vendor.find(params[:id].to_i)
  end

  def update
    @product = Product.find(params[:id].to_i)

    @product.name = params[:product][:name]
    @product.vendor_id = params[:product][:vendor_id]

    @product.save

    redirect_to action: 'show'
  end

  def destroy
    @product = Product.destroy(params[:id].to_i)
    redirect_to action: 'index'
  end

  def show_product
    @product = Product.find(params[:id].to_i)
    # @vendors = Vendor.all
  end

  private
   def post_params
     params.require(:task).permit(:title, :description)
   end
end
