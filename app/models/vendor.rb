class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :sales
  has_many :products

  # total sales for a vendor, in cents

  def total_sales
    total = 0

    self.sales.each do |sale|
      total += sale.amount
    end

    return total

  end

  def this_months_sales
    total = 0

    self.sales.each do |sale|
      if sale.purchase_time.month == DateTime.now.month && sale.purchase_time.year == DateTime.now.year
        total += sale.amount
      end
    end

    return total

  end

end
