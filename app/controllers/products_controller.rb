class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @myproduct = Product.new
    @product_method = :post
    @product_path = products_create_path
  end

  def create
    @myproduct = Product.new
    @myproduct.name = params[:product][:name]
    @myproduct.vendor_id = params[:product][:vendor_id]
    @myproduct.save
    redirect_to vendors_index_path
  end

  def show
    @myproduct = Product.find(params[:id].to_i)
  end

  def edit
    @myproduct = Product.find(params[:id].to_i)
    @product_method = :put
    @product_path = products_update_path(@myproduct.id)
    if @myproduct == nil
          render :file => 'public/404.html',
              :status => :not_found
    end
  end

  def update
    @myproduct = Product.find(params[:id].to_i)

    if @myproduct == nil
      render :file => 'public/404.html',
          :status => :not_found
    end
    @myproduct.name = params[:product][:name]
    @myproduct.vendor_id = params[:product][:vendor_id]
    @myproduct.save
    redirect_to vendors_show_path(@myproduct.vendor.id)
  end

  def destroy
    @myproduct = Product.destroy(params[:id].to_i)
    redirect_to vendors_show_path
    # @params = params
  end
end
