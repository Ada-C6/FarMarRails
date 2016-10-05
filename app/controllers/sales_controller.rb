class SalesController < ApplicationController
  def new
    @sale = Sale.new
    @method = :post
    @path = sales_create_path
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
  end
end
