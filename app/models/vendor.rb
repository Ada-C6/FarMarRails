class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :products
  has_many :sales

  validates :market_id, presence: true
  validates :name, presence: true
  validates :num_employees, presence: true, numericality: {only_integer: true}
end
