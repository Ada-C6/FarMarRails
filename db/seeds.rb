# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

markets = []

CSV.read("#{Rails.root}/seed_csvs/markets.csv").each do |line|
  market = {
    id: line[0].to_i,
    name: line[1],
    address: line[2],
    city: line[3],
    county: line[4],
    state: line[5],
    zip: line[6]
  }

  markets << market
end

markets.each do |market_hash|
  Market.create(market_hash)
end

vendors = []

CSV.read("#{Rails.root}/seed_csvs/vendors.csv").each do |line|
  vendor = {
    id: line[0].to_i,
    name: line[1],
    number_employees: line[2].to_i,
    market_id: line[3].to_i
  }

  vendors << vendor
end

vendors.each do |vendor_hash|
  Vendor.create(vendor_hash)
end

products = []

CSV.read("#{Rails.root}/seed_csvs/products.csv").each do |line|
  product = {
    id: line[0].to_i,
    name: line[1],
    vendor_id: line[2].to_i
  }

  products << product
end

products.each do |product_hash|
  Product.create(product_hash)
end

sales = []

CSV.read("#{Rails.root}/seed_csvs/sales.csv").each do |line|
  sale = {
    id: line[0].to_i,
    amount: line[1].to_i,
    purchase_time: DateTime.parse(line[2]),
    vendor_id: line[3].to_i,
    product_id: line[4].to_i
  }

  sales << sale
end

sales.each do |sale_hash|
  Sale.create(sale_hash)
end
