class SalesController < ApplicationController
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

  def index
    @sales = Sale.where(vendor_id:params[:id])
    @sale_total = total(@sales).to_f/100
    @month_sales = monthfind(@sales)
    @month_sale_total = total(@month_sales).to_f/100
  end

  def total(sales)
    total = 0
    sales.each do |sale|
      total += sale.amount
    end
    return total
  end

  def monthfind(sales)
    current_month_sales = []
    sales.each do |sale|
      if sale.purchase_time.month == Time.now.month
        current_month_sales << sale
      end
    end
    return current_month_sales
  end
end
