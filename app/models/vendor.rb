class Vendor < ActiveRecord::Base
  has_many :markets, :through => :market_vendors
end
