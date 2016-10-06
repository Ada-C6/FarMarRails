class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def find_vendor
    return Vendor.find(params[:id].to_i)
  end

  def show_vendor
    @myvendor = find_vendor
    show_all_products
  end

  def new_product
    @myvendor = find_vendor
    @myproduct = Product.new
    @product_creation_method = "post"
    @post_method = :post
    @post_path = create_product_path
  end

  def create_product
    @myvendor = find_vendor
    @params = params
    @myproduct = Product.new
    @myproduct.name = params[:product][:name]
    @myproduct.vendor_id = @myvendor.id
    @myproduct.save
    redirect_to show_vendor_path
  end

  def find_product
    return Product.find(params[:product_id].to_i)
  end

  def show_product
    @myvendor = find_vendor
    @myproduct = find_product
  end

  def show_all_products
    # @myvendor = find_vendor
    @products = @myvendor.products
  end

  def update_product
    @myvendor = find_vendor
    @myproduct = find_product
    @post_path = update_product_path

    # if @myproduct == nil
    #       render :file => 'public/404.html',
    #           :status => :not_found
    # end

    @myproduct.name = params[:product][:name]
    
    @myproduct.save
      redirect_to show_vendor_path
    
  end

  def edit_product
    @myvendor = find_vendor
    @myproduct = find_product
    @post_method = :put
    @post_path = update_product_path
    
    if @myproduct == nil
          render :file => 'public/404.html',
              :status => :not_found
    end
  end

  def destroy_product
    @myproduct = find_product
     
    if @myproduct != nil
        @myproduct.destroy
        redirect_to show_vendor
    end
  end

  def new_sale
    @mysale = Sale.new
  end

  def create_sale
    @params = params
    @mysale = Sale.new
    @sale_date = params[:purchase_date]
    @sale_product_name = params[:product_name]
    @sale_amount = params[:amount]
    @mysale.save
    redirect_to show_vendor
  end

  def find_sale
    return Sale.find(params[:id])
  end 

  def show_sale
    @mysale = find_sale
  end

  def show_all_sales
    @sales = @myvendor.sales
  end

  def total_sales
  end
end
