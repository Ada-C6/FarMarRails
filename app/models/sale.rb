class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product

  validates :vendor_id, presence: true, numericality: { only_integer: true }
  validates :product_id, presence: true, numericality: { only_integer: true }
end
