module SalesHelper
  def human_readable_time(time)
    time.strftime("%a, %b %-d, %Y")
  end

  def dollar_format(amount_in_cents)
    dollars = amount_in_cents/100
    "$ #{dollars}"
end

end
