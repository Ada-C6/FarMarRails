class Market < ActiveRecord::Base
  has_many :market_vendor_cleans
  has_many :vendors, :through => :market_vendor_cleans

  # validates :name, presence: true
  # validates :street, presence: true, uniqueness: true
  # validates :city, presence: true
  # validates :county, presence: true
  # validates :state, presence: true
  # validates :zip, presence: true
end
