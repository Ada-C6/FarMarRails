class Market < ActiveRecord::Base
  has_many :vendors

  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :street, :state, :city, presence: true

end
