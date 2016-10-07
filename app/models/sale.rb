class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product
end
