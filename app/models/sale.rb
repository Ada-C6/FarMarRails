class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
end
