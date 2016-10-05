# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.read('seed_csvs/markets.csv').each do |line|
  market = {}
  market[:name] = line[1]
  market[:address] = line[2]
  market[:city] = line[3]
  market[:county] = line[4]
  market[:state] = line[5]
  market[:zip] = line[6]

  Market.create(market)

end

CSV.read('seed_csvs/vendors.csv').each do |line|
  vendor = {}
  vendor[:name] = line[1]
  vendor[:num_employees] = line[2].to_i
  vendor[:market_id] = line[3].to_i

  Vendor.create(vendor)
end

CSV.read('seed_csvs/products.csv').each do |line|
  product = {}
  product[:name] = line[1]
  product[:vendor_id] = line[2].to_i

  Product.create(product)
end

CSV.read('seed_csvs/sales.csv').each do |line|
  sale = {}
  sale[:amount] = line[1].to_i
  sale[:purchase_time] = DateTime.parse(line[2])
  sale[:vendor_id] = line[3].to_i
  sale[:product_id] = line[4].to_i

  Sale.create(sale)
end
