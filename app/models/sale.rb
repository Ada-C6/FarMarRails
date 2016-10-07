class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product

  validates :amount, presence: true, numericality: {only_integer: true}
  validates :purchase_time, presence: true
end
