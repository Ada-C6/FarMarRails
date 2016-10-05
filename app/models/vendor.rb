class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :products
  has_many :sales

  validates :name, presence: true, uniqueness: true
  validates :employees, :market_id, presence: true, numericality: { only_integer: true }

end
