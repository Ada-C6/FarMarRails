class PagesController < ApplicationController
  before_filter :set_search

  def home
  end

  def admin
    @market = Market.new
  end

  def market
    @id = 10
  end

  def default_market_login
    if !Market.exists?(id: params[:market][:id].to_i)
      redirect_to @redirect
    else
      @id = params[:market][:id].to_i
      redirect_to controller: 'markets', action: 'show', id: @id
    end
  end

  def admin_market_login
    @redirect = '/admin'
    default_market_login
  end

  def market_login
    @redirect = '/market'
    default_market_login
  end

  def vendor
    @id = 10
  end

  def default_vendor_login
    if !Vendor.exists?(id: params[:vendor][:id].to_i)
      redirect_to @redirect
    else
      @id = params[:vendor][:id].to_i
      redirect_to controller: 'vendors', action: 'show', id: @id
    end
  end

  def vendor_login
    @redirect = '/vendor'
    default_vendor_login
  end

  def admin_vendor_login
    @redirect = '/admin'
    default_vendor_login
  end

end
