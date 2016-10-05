class Sale < ActiveRecord::Base
  has_one :product
  belongs_to :vendor
  belongs_to :market 
end
