class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :products
  has_many :sales

  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :employee_num, numericality: { only_integer: true }
  validates :market_id, presence: true, numericality: { only_integer: true }
end
