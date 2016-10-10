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
    @sale = Sale.new
  end

  def create
    @params = params
    @sale = Sale.new
    @sale.amount = params[:sale][:amount]
    @sale.purchase_time = Time.now
    @sale.vendor_id = params[:sale][:vendor_id]
    @sale.product_id = params[:sale][:product_id]

    if(@sale.save)
      #saved successfully; go to index
      redirect_to vendorsshow_path (@sale.vendor_id)
    else
      #validation failed; show the "new" form again
      render :action => :new
    end

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
    @sale = findSale
    @sale.destroy
    redirect_to vendorsshow_path (@sale.vendor_id)
  end

end
