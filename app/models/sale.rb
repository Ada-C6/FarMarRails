class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product

  def self.total(sales)
    total = 0
    sales.each do |sale|
      total += sale.amount
    end
    return total
  end

  def self.monthfind(sales)
    current_month_sales = []
    sales.each do |sale|
      if sale.purchase_time.month == Time.now.month
        current_month_sales << sale
      end
    end
    return current_month_sales
  end

  def self.make_into_cents(money)
    # check to see if the user entered a dollar sign.
    if money[0] == "$"
      money = money[1..-1]
    end

    # once dollar sign is removed, convert string to float
    money = money.to_f

    # if the float is not the same as the float.to_i, then multiply by 100 and save.
    if Integer(money) != money
      money = (money * 100)
    end

    return money.to_i
  end

end
