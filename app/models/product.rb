class Product < ActiveRecord::Base
  belongs_to :vendor
  has_many :sales

  validates :vendor_id, presence: true, numericality: true
  validates :name, presence: true
end
