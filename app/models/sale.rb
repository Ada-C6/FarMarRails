class Sale < ActiveRecord::Base
	belongs_to :product
	belongs_to :vendor


	# validates :purchase_time, presence: true
  # validates :amount, presence: true
  # validates :product_id, presence: true
  # validates :vendor_id, presence: true
end
