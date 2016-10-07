class Product < ActiveRecord::Base
  belongs_to :vendor
  has_many :sales

  validates :name, presence: true, length: {in: 1..25}
end
