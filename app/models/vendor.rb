class Vendor < ActiveRecord::Base

  has_many :sales
 has_many :products
	belongs_to :market

end
