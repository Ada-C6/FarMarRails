class MarketVendor < ActiveRecord::Base
  belongs_to :markets
  belongs_to :vendors
end
