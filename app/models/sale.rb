class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product

  validates :product_id, presence: true, numericality: true
  validates :vendor_id, presence: true, numericality: true
  validates :name, presence: true
  validates :purchase_time, presence: true
  validates :amount, presence: true, numericality: true
end
