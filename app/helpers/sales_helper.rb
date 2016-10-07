module SalesHelper
  # solution from http://stackoverflow.com/questions/7461290/convert-cents-into-dollar-string-in-ruby-without-use-of-bigdecimal
  def add_decimal(cents)
    pfx = [ '0.00', '0.0', '0.' ]
    if(pfx[cents.to_s.length])
      cents = pfx[cents.to_s.length] + cents.to_s
    else
      cents = cents.to_s.dup
      cents[-2, 0] = '.'
    end
    return cents
  end
end
