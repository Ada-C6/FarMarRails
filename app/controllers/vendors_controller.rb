class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def find_vendor
    return Vendor.find(params[:id].to_i)
  end
  def find_market
    return Market.find(params[:id].to_i)
  end

  def show_vendor
    @myvendor = find_vendor
    show_all_products
    @allsales = @myvendor.sales

    @total_sales = 0
    @allsales.each do |sale|
      @total_sales += sale.amount
    end

    @markets = @myvendor.markets
  end

  def show_market_from_vendor
    @mymarket = find_market
    @market_vendors = @mymarket.vendors
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

    if @myproduct.save
      redirect_to show_vendor_path(@myvendor.id)
    else
      @error = "Did not save successfully. Try again. \nAll fields must be filled and address must be unique!"
      @post_method = :post
      @post_path = update_product_path
      render :new_product
    end
  end

  def find_product
    return Product.find(params[:product_id].to_i)
    #where(market_id: params[:id].to_i).where(vendor_id: params[:vendor_id].to_i).first
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


    if @myproduct.save
      redirect_to show_vendor_path(@myvendor.id)
    else
      @error = "Did not save successfully. Try again. \nAll fields must be filled and address must be unique!"
      @post_method = :post
      @post_path = update_product_path
      render :edit_product
    end
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
    @myvendor = find_vendor
    @myproduct = find_product

    if @myproduct != nil
        @myproduct.destroy
        redirect_to show_vendor_path(@myvendor.id)
    end
  end

  def new_sale
    @mysale = Sale.new
    @myproduct = find_product

    @post_method = :post
    @post_path = vendor_create_sale_path
  end

  def create_sale
    @params = params
    @myproduct = find_product
    @mysale = Sale.new
    @mysale.purchase_time = DateTime.now
    @mysale.amount = params[:sale][:amount]
    @mysale.product_id = @myproduct.id
    @mysale.vendor_id = @myproduct.vendor_id

    if @mysale.save
      redirect_to show_vendor_path(@mysale.vendor_id)
    else
      @error = "Did not save successfully. Try again. \nAll fields must be filled and address must be unique!"
      @post_method = :post
      @post_path = vendor_create_sale_path
      render :new_sale
    end
  end

  def find_sale
    return Sale.find(params[:id])
  end

  def show_sale
    @mysale = find_sale
  end

  def show_all_sales
    @myvendor = find_vendor
    @allsales = @myvendor.sales

    @total_sales = 0
    @allsales.each do |sale|
      @total_sales += sale.amount
    end
  end

  def total_sales
  end
end
