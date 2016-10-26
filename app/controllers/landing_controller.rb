class LandingController < ApplicationController
  def index
  end

  def show_item_type
  	@products = Product.all

  	@types = []

  	@products.each do |product|
  		type = product.split(/\W+/)
  		@types << type[1]
  	end
  	
  	return @types
  end
end
