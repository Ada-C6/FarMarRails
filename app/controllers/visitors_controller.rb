class VisitorsController < ApplicationController
  def find_all
    @markets = Market.all
    @vendors = Vendor.all
    @products = Product.all
  end

  def find_market
    return Market.find(params[:id].to_i)
  end

  def index
    find_all
  end

  def show_markets
    find_all
  end


  def show_vendors
    find_all
  end

  def show_products
    find_all
  end

  def show_market_vendor_products
  end
end
