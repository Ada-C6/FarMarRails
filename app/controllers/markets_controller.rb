class MarketsController < ApplicationController
  def index
    @allmarkets = Market.all
  end

  def show
    @market = Market.find(params[:id].to_i)
    @vendors_in_market = @market.vendors
  end

  def create
    @params = params

    @mar = Market.create({name: params[:market][:name], street: params[:market][:street], city: params[:market][:city], county: params[:market][:county], state: params[:market][:state], zip: params[:market][:zip]})

    redirect_to action: 'index'
  end

  def new
    @mar = Market.new
  end

  def edit
    @mar = Market.find(params[:id].to_i)
  end

  def update
    self.edit
    @params = params
    @mar.update({name: params[:market][:name], street: params[:market][:street], city: params[:market][:city], county: params[:market][:county], state: params[:market][:state], zip: params[:market][:zip]})

    redirect_to controller: "general_users", action: "show"
  end

  def destroy
    num = params[:id].to_i
    Market.find(num).destroy
    redirect_to action: "index"
  end


  ################ Modify Vendor information ###################

  def newvendor
    @ven = Vendor.new
  end

  def createvendor
    @params = params

    @ven = Vendor.create({name: params[:vendor][:name], employee_num: params[:vendor][:employee_num], market_id: params[:vendor][:market_id]})
  end

  def editvendor
    @ven = Vendor.find(params[:id].to_i)
  end

  def updatevendor
    self.editvendor
    @params = params

    @ven.update({name: params[:vendor][:name], employee_num: params[:vendor][:employee_num], market_id: params[:vendor][:market_id]})

    redirect_to action: "show", id: @ven.market_id
  end

  def destroyvendor
    num = params[:id].to_i
    Vendor.find(num).destroy
    redirect_to action: "index"
  end
end
