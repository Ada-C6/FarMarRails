class Market < ActiveRecord::Base
  has_many :vendors

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :county, presence: true
  validates :state, presence: true
  validates :zip, numericality: { greater_than: 1000,  less_than: 99951, only_integer: true } 

end
