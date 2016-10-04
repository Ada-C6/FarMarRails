# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# for markets:

require 'csv'


CSV.read('seed_csvs/markets.csv').map do |line|
  market_hash = {}
  market_hash[:name] = line[1]
  market_hash[:address] = line[2]
  market_hash[:city] = line[3]
  market_hash[:state] = line[4]
  market_hash[:zip] = line[5]
  Market.create(market_hash)
end

CSV.read('seed_csvs/vendors.csv').map do |line|
  vendor_hash = {}
  vendor_hash[:name] = line[1]
  vendor_hash[:num_employees] = line[2]
  vendor_hash[:market_id] = line[3]
  Vendor.create(vendor_hash)
end


CSV.read('seed_csvs/products.csv').map do |line|
  product_hash = {}
  product_hash[:name] = line[1]
  product_hash[:vendor_id] = line[2]
  Product.create(product_hash)
end

CSV.read('seed_csvs/sales.csv').map do |line|
  sale_hash = {}
  sale_hash[:amount] = line[1]
  sale_hash[:purchase_time] = line[2]
  sale_hash[:vendor_id] = line[3]
  sale_hash[:product_id] = line[4]
  Sale.create(sale_hash)
end
