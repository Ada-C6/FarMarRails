class SalesController < ApplicationController
  def findSale
    return Sale.find(params[:id].to_i)
  end

  def index
  end

  def show
    @sale = findSale
  end

  def new
  end

  def create
  end

  def edit
    @sale = findSale

    if @sale == nil
          render :file => 'public/404.html',
              :status => :not_found
    end
  end

  def update
    @sale = findSale

    if @sale == nil
          render :file => 'public/404.html',
              :status => :not_found
    end

    if @sale.update(amount: params[:sale][:amount], purchase_time: params[:sale][:purchase_time], vendor_id: params[:sale][:vendor_id], product_id: params[:sale][:product_id])
      redirect_to action: "show"
    else
      render 'edit'
    end
  end

  def destroy
  end
end
