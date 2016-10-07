class Sale < ActiveRecord::Base
  belongs_to :product
  belongs_to :vendor

  require 'path_check.rb'
  include PathCheck

  validates :vendor_id, presence: true
  validates :product_id, presence: true

end
