class Sale < ActiveRecord::Base
  belongs_to :product
  belongs_to :vendor

  require 'path_check.rb'
  include PathCheck

end
