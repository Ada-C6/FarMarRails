# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach('seed_csvs/markets.csv') do |csv_obj|
  Market.create(id: csv_obj[0].to_i, name: csv_obj[1], address: csv_obj[2], city: csv_obj[3], county: csv_obj[4], state: csv_obj[5], zip: csv_obj[6])
end

CSV.foreach('seed_csvs/products.csv') do |csv_obj|
  Product.create(id: csv_obj[0].to_i, name: csv_obj[1], vendor_id: csv_obj[2].to_i)
end

CSV.foreach('seed_csvs/vendors.csv') do |csv_obj|
  Vendor.create(id: csv_obj[0].to_i, name: csv_obj[1], employees: csv_obj[2].to_i, market_id: csv_obj[3].to_i)
end

CSV.foreach('seed_csvs/sales.csv') do |csv_obj|
  Sale.create(id: csv_obj[0].to_i, amount: csv_obj[1].to_i, purchase_time: csv_obj[2], vendor_id: csv_obj[3].to_i, product_id: csv_obj[4].to_i)
end
