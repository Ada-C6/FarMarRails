module ApplicationHelper

  def to_dollars(amount)
    dollars = (amount/100.0)
    return "$#{dollars.round(2)}"
  end

end
