# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.read('./seed_csvs/markets.csv').each do |line|
  csv_market = {
    name: line[1],
    address: line[2],
    city: line[3],
    county: line[4],
    state: line[5],
    zip: line[6]
  }
  Market.create(csv_market)
end

CSV.read('./seed_csvs/vendors.csv').each do |line|
  csv_vendor = {
    name: line[1],
    num_employees: line[2],
    market_id: line[3]
  }
  Vendor.create(csv_vendor)
end

CSV.read('./seed_csvs/products.csv').each do |line|
  csv_product = {
    name: line[1],
    vendor_id: line[2]
  }
  Product.create(csv_product)
end

CSV.read('./seed_csvs/sales.csv').each do |line|
  csv_sale = {
    amount: line[1],
    purchase_time: line[2],
    vendor_id: line[3],
    product_id: line[4]
  }
  Sale.create(csv_sale)
end
