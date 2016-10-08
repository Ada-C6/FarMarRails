class Vendor < ActiveRecord::Base
  belongs_to :market
  has_many :products

  def sales
    sales = []
    products.each do |product|
      sales += product.sales
    end
    return sales
  end

  def sales_total(sales)
    total_amount = 0
    sales.each do |sale|
      total_amount += sale.amount
    end
    total_amount = total_amount/100.0
    return sprintf "%.2f", total_amount
  end

  def sales_current_month
    current_sales = []
    current_month = DateTime.now
    sales.each do |sale|
      if ((sale.purchase_time.year == current_month.year) && (sale.purchase_time.month == current_month.month))
        current_sales << sale
      end
    end
    return current_sales
  end

  def current_month_total
    sales_total(sales_current_month)
  end

  # def self.by_letter(array_of_letters)
  #   results = []
  #   array_of_letters.each do |letter|
  #     letter.upcase!
  #     results += self.where.("name like?", "#{letter}%").order(:name)
  #   end
  #   return results
  # end
end
