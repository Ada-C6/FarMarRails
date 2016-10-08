#changes a fixnum in cents to the US dollar amount (a string)
# 200.to_money => "$2.00"
class Fixnum
	def to_money
		return Money.new(self,"USD").format
	end
end