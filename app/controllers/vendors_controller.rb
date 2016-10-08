require 'date'
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
    @vendor_id = params[:id].to_i
    @vendor = Vendor.find(@vendor_id)
    @products = Product.all
    @markets = Market.all
    @sales = Sale.all

    @sale_sum = self.sale_sum(@vendor_id)


    begin_time = Date.today.strftime("%Y%m")
    end_time = (Date.today>>1).strftime("%Y%m")
    puts begin_time, end_time
    @sale_month = self.sale_month(begin_time, end_time, @vendor_id)

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
    @product_id = params[:id].to_i
    @product = Product.find(@product_id)
    # find all Sales that has certain product ID
    @sales = Sale.where(product_id: @product_id).all
    # @vendors = Vendor.all
  end

################## Modify Sales ##################
  def new_sale
    @product_id = params[:product_id]
    @vendor_id = params[:vendor_id]
    @sale = Sale.new
  end

  def show_sale
    @sale = Sale.find(params[:id].to_i)
  end

  def create_sale
    @params = params

    @sale = Sale.new
    # FIXME: Amount should be a float number.
    @sale.amount = params[:sale][:amount].to_i
    @sale.vendor_id = params[:sale][:vendor_id].to_i
    @sale.product_id = params[:sale][:product_id].to_i
    @sale.purchase_time = Time.now

    @sale.save

    redirect_to action: 'show_product', id:@sale.product_id
  end

  def sale_sum(vendor_id)
    sales = Sale.where(vendor_id: vendor_id).all
    sale_sum = 0
    sales.each do |sale|
      sale_sum += sale.amount
    end
    return sale_sum.to_f
  end

  def sale_month(begin_time, end_time, vendor_id)
    # find all Sales that has certain product ID
    sales = Sale.where(Vendor_id: vendor_id).all

    sales_month = sales.where("created_at > ? AND created_at < ?", begin_time, end_time).all

    sale_month = 0
    sales_month.each do |sale|
      sale_month += sale.amount
    end
    return sale_month.to_f
    # sales_month

  end




  private
   def post_params
     params.require(:task).permit(:title, :description)
   end


end
