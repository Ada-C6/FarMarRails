# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach('seed_csvs/markets.csv', :headers => true) do |csv_obj|
  Market.create(id: csv_obj['id'].to_i, name: csv_obj['name'], street: csv_obj['street'], city: csv_obj['city'], county: csv_obj['county'], state: csv_obj['state'], zip: csv_obj['zip'])
end

CSV.foreach('seed_csvs/vendors.csv', :headers => true) do |csv_obj|
  Vendor.create(id: csv_obj['id'].to_i, name: csv_obj['name'], num_employees: csv_obj['num_employees'])
end

CSV.foreach('seed_csvs/market_vendors_clean.csv', :headers => false) do |csv_obj|
  MarketVendorClean.create(market_id: csv_obj[0], vendor_id: csv_obj[1])
end

CSV.foreach('seed_csvs/products.csv', :headers => true) do |csv_obj|
  Product.create(id: csv_obj['id'].to_i, name: csv_obj['name'], vendor_id: csv_obj['vendor_id'])
end

CSV.foreach('seed_csvs/sales.csv', :headers => true) do |csv_obj|
  Sale.create(id: csv_obj['id'].to_i, amount: csv_obj['amount'], purchase_time: csv_obj['purchase_time'], vendor_id: csv_obj['vendor_id'], product_id: csv_obj['product_id'])
end

CSV.foreach('seed_csvs/products.csv', :headers => true) do |csv_obj|
  Product.create(id: csv_obj['id'].to_i, name: csv_obj['name'], vendor_id: csv_obj['vendor_id'])
end

CSV.foreach('seed_csvs/sales.csv', :headers => true) do |csv_obj|
  Sale.create(id: csv_obj['id'].to_i, amount: csv_obj['amount'], purchase_time: csv_obj['purchase_time'], vendor_id: csv_obj['vendor_id'], product_id: csv_obj['product_id'])
end
