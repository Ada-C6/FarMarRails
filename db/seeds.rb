# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'csv'
#
#
# farm_mrkt = []
# CSV.open('./seed_csvs/markets.csv', 'r'). each do |place|
#   markets = {}
#   markets[:id] = place[0].to_i
#   markets[:name] = place[1]
#   markets[:address] = place[2]
#   markets[:city] = place[3]
#   markets[:county] = place[4]
#   markets[:state] = place[5]
#   markets[:zip] = place[6]
#   farm_mrkt << Market.create(markets)
# end
#
#
# farm_vend = []
# CSV.open('./seed_csvs/vendors.csv', 'r').each do |vend|
#   vendors = {}
#   vendors[:id] = vend[0].to_i
#   vendors[:name] = vend[1]
#   vendors[:employee_number] = vend[2]
#   vendors[:market_id] = vend[3].to_i
#   farm_vend << Vendor.create(vendors)
# end
#
# merch = []
# CSV.open('./seed_csvs/products.csv', 'r').each do |line|
#   products = {}
#   products[:id] = line[0].to_i
#   products[:name] = line[1]
#   products[:vendor_id] = line[2].to_i
#   merch << Product.create(products)
# end
#
#
# discount = []
# CSV.open('./seed_csvs/sales.csv', 'r').each do |line|
#   sales = {}
#   sales[:id] = line[0].to_i
#   sales[:amount] = line[1].to_i
#   sales[:purchase_time] = line[2]
#   sales[:vendor_id] = line[3].to_i
#   sales[:product_id] = line[4].to_i
#   discount << Sale.create(sales)
# end
