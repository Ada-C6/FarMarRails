class Product < ActiveRecord::Base
  belongs_to :vendor
  has_many :sales
  validates :name, presence: true
  validates :vendor_id, presence: true
end
