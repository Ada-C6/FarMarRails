class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product

  validates :vendor_id, presence: true, numericality: { only_integer: true }
  validates :product_id, presence: true, numericality: { only_integer: true }
  def amount
    return self[:amount].to_f/100
  end
  def amount=(amount_in_dollar)
    self[:amount] = mount_in_dolla.to_f * 100
  end
end
