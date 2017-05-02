class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_search
    @search_market = Market.search(params[:q])
    @search_vendor = Vendor.search(params[:q])
    @search_product = Product.search(params[:q])
  end
end
