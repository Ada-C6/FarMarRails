require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Market seed
CSV.read("seed_csvs/markets.csv").each do |line|
  # TODO: We can refactor to use a hash here, but this works for now.

  id, name, address, city, county, state, zip = line # parallel assignment!

  id = id.to_i # need id to be a fixnum

  market = Market.new(id: id, name: name, street_address: address, city: city, county: county, state: state, zip_code: zip)

  market.save
end


# Sales seed
# CSV.read("support/sales.csv").each do |line|
#   sale_id, amount, purchase_time, vendor_id, product_id = line # parallel assignment!
#   sale_id = sale_id.to_i # need sale_id to be a fixnum
#   amount = amount.to_i # want amount to be a fixnum also
#   vendor_id = vendor_id.to_i # want vendor_id to be a fixnum
#   product_id = product_id.to_i # want product_id also to be a fixnum
#
#   sale = Sale.new(sale_id, amount, purchase_time, vendor_id, product_id)
#   sale.save
# end
