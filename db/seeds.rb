# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'csv'


# seed Markets

CSV.foreach('seed_csvs/markets.csv') do |line|
  Market.create(name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6])
end

# seed Vendors

CSV.foreach('seed_csvs/vendors.csv') do |line|
  Vendor.create(name: line[1], no_employees: line[2], market_id: line[3])
end

# seed Products

CSV.foreach('seed_csvs/products.csv') do |line|
  Product.create(name: line[1], vendor_id: line[2])
end

# seed Sales

#
# CSV.foreach('seed_csvs/sales.csv') do |line|
#   Sale.create(amount: line[1], purchase_time: line[2], vendor_id: line[3], product_id: line[4])
# end
