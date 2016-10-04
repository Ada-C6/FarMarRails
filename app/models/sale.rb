class Sale < ActiveRecord::Base
  belongs_to :product, :vendor
end
