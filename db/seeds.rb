# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach('seed_csvs/markets.csv', :headers => false ) do |market_obj|
  Market.create(id: market_obj[0].to_i, name: market_obj[1], street: market_obj[2], city: market_obj[3], county: market_obj[4], state: market_obj[5], zip: market_obj[6])
end

CSV.foreach('seed_csvs/products.csv', :headers => false ) do |product_obj|
  Product.create(id: product_obj[0].to_i, name: product_obj[1], vendor_id: product_obj[2])
end

CSV.foreach('seed_csvs/sales.csv', :headers => false ) do |sale_obj|
  Sale.create(id: sale_obj[0].to_i, amount: sale_obj[1], purchase_time: sale_obj[2], vendor_id: sale_obj[3], product_id: sale_obj[4])
end

CSV.foreach('seed_csvs/vendors.csv', :headers => false ) do |vendor_obj|
  Vendor.create(id: vendor_obj[0].to_i, name: vendor_obj[1], employee_num: vendor_obj[2], market_id: vendor_obj[3])
end
