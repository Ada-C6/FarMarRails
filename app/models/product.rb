class Product < ActiveRecord::Base
  has_many :sales
  belongs_to :vendor

  validates :vendor_id, presence: true
end
