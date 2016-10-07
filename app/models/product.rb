class Product < ActiveRecord::Base
  belongs_to :vendor
  has_many :sales
  has_many :markets

  validates :name, presence: true
  validates :vendor_id, presence: true, numericality: { only_integer: true }
end
