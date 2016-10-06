class Market < ActiveRecord::Base
  has_many :vendors

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :county, presence: true
  validates :state, presence: true
  validates :zip, numericality: true, length: {in: 4..10}

end
