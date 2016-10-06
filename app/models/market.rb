class Market < ActiveRecord::Base
  has_many :vendors
  has_many :products
  has_many :sales

  validates :name, presence: true, uniqueness: true
  validates :address, :city, :state, :county, presence: true
  validates :zip, presence: true, numericality: { only_integer: true }

end
