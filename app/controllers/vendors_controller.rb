class VendorsController < ApplicationController
  def index
    @vendor_list = Vendor.all
  end

  def show
    this_vendor = Integer(params[:id])
    @this_vendor = Vendor.find(this_vendor)
  end

  def show_products
    this_vendor = Integer(params[:id])
    @this_vendors_products = Product.where(vendor_id: this_vendor)
  end

  def show_sales
    this_vendor = Integer(params[:id])
    @this_vendors_sales = Sale.where(vendor_id: this_vendor)
  end
end
