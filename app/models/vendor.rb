class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :products
  has_many :sales

  def add_vendor_link
    if params[:market_id] != nil
      return link_to "Add a new vendor for this market", new_market_vendor_path(@vendors[0].market_id)
    end
  end
end
