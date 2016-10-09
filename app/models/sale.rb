class Sale < ActiveRecord::Base
  belongs_to :product
  belongs_to :vendor

  require 'path_check.rb'
  include PathCheck

  # accepts_nested_attributes_for :sales#,
  # :reject_if => proc {|attributes|
  #   attributes.all? {|k,v| v.blank?}
  # }

  # validates :vendor_id, presence: true
  # # validates :product_id, presence: true
end
