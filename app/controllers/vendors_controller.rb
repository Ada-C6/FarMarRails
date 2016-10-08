class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def new
    @product = Product.new
    @vendor = Vendor.find(params[:id].to_i)
  end


  def create
    @params = params

    @product = Product.new
    @product.name = params[:product][:name]
    @product.vendor_id = params[:id].to_i

    @product.save

    redirect_to action: 'show', id:@product.vendor_id

  end

  def show
    @vendor = Vendor.find(params[:id].to_i)
    @products = Product.all
    @markets = Market.all
    @sales = Sale.all
  end

  def edit
    @product = Product.find(params[:id].to_i)
    @vendor = Vendor.find(@product.vendor_id)
  end

  def update
    @product = Product.find(params[:id].to_i)

    @product.name = params[:product][:name]
    @product.vendor_id = params[:product][:vendor_id]

    @product.save

    redirect_to action: 'show', id:@product.vendor_id
  end

  def destroy
    @product = Product.destroy(params[:id].to_i)
    redirect_to action: 'index'
  end

  def show_product
    @product = Product.find(params[:id].to_i)
    @sale = Sale.find(params[:id].to_i)
    # @vendors = Vendor.all
  end

################## Modify Sales ##################
  def new_sale
    @sale = Sale.new
  end

  def show_sale
    @sale = Sale.find(params[:id].to_i)
  end

  def create_sale
    @params = params

    @sale.amount = params[:sale][:amount].to_i
    @sale.purchase_time = Time.now

    @sale.save

    redirect_to action: 'show', id:@product.vendor_id
  end

  private
   def post_params
     params.require(:task).permit(:title, :description)
   end
end
