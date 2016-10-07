class Sale < ActiveRecord::Base
  belongs_to :product
  belongs_to :vendor
  validates :amount, presence: true
end
