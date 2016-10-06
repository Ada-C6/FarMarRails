class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :products
  has_many :sales

  # validates :market_id, presence: true
  # validates :name, presence: true
end
