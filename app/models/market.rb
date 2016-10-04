class Market < ActiveRecord::Base
  has_many :vendors, :through => :market_vendors
end
