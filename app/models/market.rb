class Market < ActiveRecord::Base
  has_many :vendors
  has_many :products, through :vendors
  has_many :sales, through :vendors
end
