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
  MarketVendor.create(markets_id: csv_obj[0], vendors_id: csv_obj[1])
end
