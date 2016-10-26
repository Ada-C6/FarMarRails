class MarketsController < ApplicationController
  def findMarket
    return Market.find(params[:id].to_i)
  end

  def findVendor
    return Vendor.find(params[:vendor_id].to_i)
  end
  def findMarketVendorClean
    return MarketVendorClean.where(market_id: params[:id].to_i).where(vendor_id: params[:vendor_id].to_i).first

  end

  def index
    @markets = Market.all
  end

  def show
    @mymarket = findMarket
    @market_vendors = @mymarket.vendors
  end

  def new
    @mymarket = Market.new
    @post_method = :post
    @post_path = market_create_path
  end

  def create
    @params = params
    @mymarket = Market.new
    @mymarket.name = params[:market][:name]
    @mymarket.street = params[:market][:street]
    @mymarket.city = params[:market][:city]
    @mymarket.county = params[:market][:county]
    @mymarket.state = params[:market][:state]
    @mymarket.zip = params[:market][:zip]

    if @mymarket.save
      redirect_to market_index_path
    else
      @error = "Did not save successfully. Try again. \nAll fields must be filled and address must be unique!"
      @post_method = :post
      @post_path = market_create_path
      render :new
    end
  end

  def edit
    @mymarket = findMarket
    @post_method = :put
    @post_path = market_update_path
  end

  def update
    @params = params
    @mymarket = findMarket
    if @mymarket == nil
        render :file => 'public/404.html',
            :status => :not_found
    end
    @mymarket.name = params[:market]["name"]
    @mymarket.street = params[:market]["street"]
    @mymarket.city = params[:market]["city"]
    @mymarket.county = params[:market]["county"]
    @mymarket.state = params[:market]["state"]
    @mymarket.zip = params[:market]["zip"]

    # @mymarket.save!
    if @mymarket.save
      redirect_to market_index_path
    else
      @error = "Did not save successfully. Try again."
      @post_method = :put
      @post_path = market_update_path
      render :edit
    end
  end

  def destroy
    @mymarket = findMarket
    if @mymarket != nil
      @mymarket.destroy
      redirect_to market_index_path
    end
  end

  def vendor_index
  end

  def vendor_show
    @mymarket = findMarket
    @myvendor = findVendor
    @vendor_products = @myvendor.products
    @vendor_markets = @myvendor.markets
  end

  def vendor_new
    @mymarket = findMarket
    @myvendor = Vendor.new
    @post_method = :post
    @post_path = market_vendor_create_path(@mymarket.id)
  end

  def vendor_create
    @mymarket = findMarket
    @params = params
    @myvendor = Vendor.new
    @myvendor.name = params[:vendor][:name]
    @myvendor.num_employees = params[:vendor][:num_employees]

    if @myvendor.save
      @market_vendor_join = MarketVendorClean.new
      @market_vendor_join.market_id = @mymarket.id
      @market_vendor_join.vendor_id = @myvendor.id
      @market_vendor_join.save
      redirect_to market_show_path(@mymarket.id)
    else
      @error = "Did not save successfully. Try again."
      @post_method = :post
      @post_path = market_vendor_create_path(@mymarket.id)
      render :vendor_new
    end
  end

  def vendor_edit
    @mymarket = findMarket
    @myvendor = findVendor
    @post_method = :put
    @post_path = market_vendor_update_path(@mymarket.id, @myvendor.id)
  end

  def vendor_update
    @mymarket = findMarket
    @params = params
    @myvendor = findVendor
    @myvendor.name = params[:vendor][:name]
    @myvendor.num_employees = params[:vendor][:num_employees]

    if @myvendor.save
      @market_vendor_join = findMarketVendorClean
      if (@market_vendor_join != nil)
        @market_vendor_join.market_id = @mymarket.id
        @market_vendor_join.vendor_id = @myvendor.id
        @market_vendor_join.save
      end
      redirect_to market_show_path(@mymarket.id)
    else
      @error = "Did not save successfully. Try again."
      @post_method = :put
      @post_path = market_vendor_update_path(@mymarket.id, @myvendor.id)
      render :vendor_edit
    end
  end

  def vendor_destroy
    @myvendor = findVendor
    @mymarket = findMarket
    @market_vendor_join = findMarketVendorClean
    if @market_vendor_join != nil
      @market_vendor_join.destroy
      redirect_to market_show_path(@mymarket.id)
    end
  end
end
