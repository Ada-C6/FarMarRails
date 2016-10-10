class Sale < ActiveRecord::Base
  belongs_to :product
  belongs_to :vendor
  belongs_to :market

  validates :amount, presence: true, numericality: { only_integer: true }
  validates :vendor_id, presence: true, numericality: { only_integer: true }
  validates :product_id, presence: true, numericality: { only_integer: true }

end
