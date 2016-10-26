class Vendor < ActiveRecord::Base
  has_many :market_vendor_cleans
  has_many :markets, :through => :market_vendor_cleans
  has_many :products
  has_many :sales

  # validates :name, presence: true
  # validates :num_employees, presence: true
end
