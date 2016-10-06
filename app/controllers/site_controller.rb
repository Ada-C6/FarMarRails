class SiteController < ApplicationController
  def index
  end

  def market_portal
  end

  def vendor_portal
    @vendors = Vendor.all.order(:name)
  end
end
