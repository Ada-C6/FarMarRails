class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :sales
  has_many :products

  validates :name, presence: true
  validates :no_of_employees, presence: true, numericality: {only_integer: true}

end
