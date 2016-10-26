class Product < ActiveRecord::Base
	has_many :sales
	belongs_to :vendor

	# validates :name, presence: true
	# validates :vendor_id, presence: true
end
