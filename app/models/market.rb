class Market < ActiveRecord::Base
  has_many :vendors

  def full_address
    "#{address}, #{city}, #{county}, #{state} #{zip}"
  end
end
