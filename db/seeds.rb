# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'CSV'

markets_list = []
CSV.read("seed_csvs/markets.csv").each do |line|
  markets_list.push(
  {
  name: line[1],
  address: line[2],
  city: line[3],
  county: line[4],
  state: line[5],
  zip: line[6]
})
end

markets_list.each do |market_hash|
  Market.create(market_hash)
end

products_list = []

CSV.read("seed_csvs/products.csv").each do |line|
  products_list.push(
  {
  name: line[1],
  vendor_id: line[2]
})
end

products_list.each do |product_hash|
  Product.create(product_hash)
end

sales_list = []

CSV.read("seed_csvs/sales.csv").each do |line|
  sales_list.push(
  {
  amount: line[1],
  purchase_time: line[2],
  vendor_id: line[3],
  product_id: line[4]
})
end

sales_list.each do |sale_hash|
  Sale.create(sale_hash)
end

vendors_list = []

CSV.read("seed_csvs/vendors.csv").each do |line|
  vendors_list.push(
  {
  name: line[1],
  num_employees: line[2],
  market_id: line[3]
})
end

vendors_list.each do |vendor_hash|
  Vendor.create(vendor_hash)
end
