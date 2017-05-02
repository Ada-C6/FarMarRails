class VendorsController < ApplicationController
  before_filter :set_search

  def index
    if params[:commit] == "search"
      if !params[:q].blank?
        @results = Vendor.search(params[:q])
      else
        @results = Vendor.search({:id_eq => 0})
      end

      @vendors = @results.result

    else
      @vendors = Vendor.all
    end
  end

  def all
    @vendors = Vendor.all
  end

  def show
    find

    @product = Product.new
  end

  def guest_show
    find
  end

  def show_sales
    find

    @sale = Sale.new

    total_sales
  end

  def total_sales
    find

    @all_sales = @vendor.sales

    @cents = 0

    @all_sales.each do |sale|
      if !sale.amount.nil?
        @cents += sale.amount
      end
    end

    @total = "$#{'%.2f' % (@cents.to_i/100.0)}"

  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new

    @vendor.name = params[:vendor][:name]
    @vendor.description = params[:vendor][:description]
    @vendor.num_of_employees = params[:vendor][:num_of_employees]
    @vendor.market_id = params[:vendor][:market_id]
    @vendor.save

    redirect_to action: 'show', id: @vendor.id
  end

  def edit
    find
  end

  def update
    find

    @vendor.name = params[:vendor][:name]
    @vendor.description = params[:vendor][:description]
    @vendor.num_of_employees = params[:vendor][:num_of_employees]
    @vendor.market_id = params[:vendor][:market_id]

    @vendor.save

    redirect_to action: 'show', id: @vendor.id
  end

  def destroy
    find

    @vendor.destroy

    redirect_to controller: 'markets', action: 'show', id: @vendor.market.id
  end

  private
  def find
    @vendor = Vendor.find(params[:id].to_i)
  end
end
