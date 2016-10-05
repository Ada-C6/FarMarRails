class ProductsController < ApplicationController

  def findProduct
    return Product.find(params[:id].to_i)
  end

  def index
  end

  def show
    @product = findProduct
  end

  def new
    @product = Product.new
  end

  def create
   @params = params
   @product = Product.new
   @product.name = params[:product][:name]
   @product.vendor_id = params[:product][:vendor_id]

   if(@product.save)
     #saved successfully; go to index
     redirect_to :action => "index"
   else
     #validation failed; show the "new" form again
     render :action => :new
   end
  end

  def edit
    @product = findProduct

    if @product == nil
          render :file => 'public/404.html',
              :status => :not_found
    end
  end

  def update
    @product = findProduct

    if @product == nil
          render :file => 'public/404.html',
              :status => :not_found
    end

    if @product.update(name: params[:product][:name], vendor_id: params[:product][:vendor_id])
      redirect_to action: "show"
    else
      render 'edit'
    end
  end

  def destroy
  end
end
