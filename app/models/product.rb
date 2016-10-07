class Product < ActiveRecord::Base
  belongs_to :vendor
  has_many :sales

  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :vendor_id, presence: true, numericality: { only_integer: true }
end
