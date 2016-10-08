# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.read('seed_csvs/markets.csv').each do |line|
  market_hash = { ref_id: line[0].to_i, name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6]}
  Market.create(market_hash)
end

CSV.read('seed_csvs/vendors.csv').each do |line|
  vendor_hash = { ref_id: line[0].to_i, name: line[1], num_employees: line[2].to_i, market_id: line[3].to_i}
  Vendor.create(vendor_hash)
end

CSV.read('seed_csvs/products.csv').each do |line|
  product_hash = { ref_id: line[0].to_i, name: line[1], vendor_id: line[2].to_i}
  Product.create(product_hash)
end

CSV.read('seed_csvs/sales.csv').each do |line|
  sale_hash = { ref_id: line[0].to_i, amount: line[1].to_i, purchase_time: DateTime.parse(line[2]), vendor_id: line[3].to_i, product_id: line[4].to_i}
  Sale.create(sale_hash)
end
