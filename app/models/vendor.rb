class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :products
  has_many :sales


  validates :name, presence: true
  validates :market_id, presence: true, numericality: true
  validates :num_employees, presence: true, numericality: true



  def sales_total
    total = 0
    sales.each do |sale|
      total += sale.amount.to_i
    end
    return total
  end

  def get_current_month
    t = Time.now
    return t.month
  end

  def sales_total_current_month(month)
    total = 0
    sales.each do |sale|
      if sale.purchase_time.month == month && sale.purchase_time.year == Time.now.year
        total += sale.amount.to_i
      end
    end
    return total
  end

  def sales_this_month(month)
    monthly_sales = []
    sales.each do |sale|
      if sale.purchase_time.month == month && sale.purchase_time.year == Time.now.year
        monthly_sales << sale
      end
    end
    return monthly_sales
  end
end
