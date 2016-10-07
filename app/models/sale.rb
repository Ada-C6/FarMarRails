class Sale < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product
  # scope :in_month, -> (month) {where("strftime('%m', purchase_time)=?", sprintf("%02d",month))}
  # scope :in_year, -> (year) {where("strftime('%Y', purchase_time)=?", sprintf("%04d",year))}

  scope :in_timeframe, -> (month,year) {where("purchase_time between ? and ?", DateTime.new(year.to_i,month.to_i,1), DateTime.new(year.to_i,month.to_i,-1))}
end
