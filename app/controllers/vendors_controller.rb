class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def new
  end

  def create
  end

  def show
    sales_list
      total
      @myvendors = Vendor.find(params[:id])
      @myproducts=@myvendors.products
  end

  def edit
    @myvendor = Vendor.find(params[:id].to_i)
  end

  def destroy
  end

  private
  def total
    @total_sales = []
    @myvendor = Vendor.find(params[:id].to_i)
    @mysale = Sale.all
    @mysale.each do |sale|
    if @myvendor.id == sale.vendor_id
      @total_sales << sale.amount
    @total = @total_sales.inject (0) { |result, element| result + element }
    end
    end
    return @total
  end

  def sales_list
    @sales = []
    @myvendor = Vendor.find(params[:id].to_i)
    @mysale = Sale.all
    @mysale.each do |sale|
    if @myvendor.id == sale.vendor_id
      @sales << sale
    end
    end
    return @sales
  end


end#end of class
