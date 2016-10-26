class ProductSearchController < ApplicationController
  def index
  end

  def show
  	# @products = Product.all

  	# @types = []

  	# @products.each do |product|
  	# 	type = product.name.to_s.split(/\W+/)
  	# 	unless type[1] == nil
  	# 		@types << type[1]
  	# 	end
  	# end
  	# 	@types = @types.uniq
  	# return @types
  	# raise

  	veggie_search
  end

  def define_type(name)
  	Product.where("name like ?", "%#{name}%")
  end

  def veggie_search
  	vegetables = ['beets', 'greens', 'mushrooms', 'carrots']

  	veggie_array = vegetables.map do |v|
  		define_type(v)
  	end.flatten

  	@veggie_search = Market.joins(:vendors).merge(Vendor.joins(:products).merge(Product.where(id: veggie_array.map(&:id)))).distinct

  end

  def seafood_search
  	seafood = ['fish', 'salmon']

  	seafood_array = seafood.map do |s|
  		define_type(s)
  	end.flatten

  	@seafood_search = Market.joins(:vendors).merge(Vendor.joins(:products).merge(Product.where(id: seafood_array.map(&:id)))).distinct

  end

	def meat_search
	  meat = ['chicken', 'beef']

	  meat_array = meat.map do |m|
	  	define_type(m)
	  end.flatten

	  @meat_search = Market.joins(:vendors).merge(Vendor.joins(:products).merge(Product.where(id: meat_array.map(&:id)))).distinct
  	end

	def carbs_search
	  carbs = ['bread', 'pretzel', 'burrito']

	  carbs_array = carbs.map do |c|
	  	define_type(c)
	  end.flatten

	  @carbs_search = Market.joins(:vendors).merge(Vendor.joins(:products).merge(Product.where(id: carbs_array.map(&:id)))).distinct
	end  	

	def fruit_search
	  fruit = ['fruit', 'apple']

	  fruit_array = fruit.map do |f|
	  	define_type(f)
	  end.flatten

	  @fruit_search = Market.joins(:vendors).merge(Vendor.joins(:products).merge(Product.where(id: fruit_array.map(&:id)))).distinct
	end  

	def sweets_search
	  sweets = ['honey', 'chocolate']

	  sweets_array = sweets.map do |s|
	  	define_type(s)
	  end.flatten

	  @sweets_search = Market.joins(:vendors).merge(Vendor.joins(:products).merge(Product.where(id: sweets_array.map(&:id)))).distinct
	end  
end


