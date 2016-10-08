class Market < ActiveRecord::Base
  has_many :vendors

  def all_vendors
    self.vendors
  end

end
