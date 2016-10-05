class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :sales
  has_many :products
end
