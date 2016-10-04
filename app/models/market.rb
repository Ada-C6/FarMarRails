class Market < ActiveRecord::Base
  has_many :vendors
  has_many :products
  has_many :sales 
end
