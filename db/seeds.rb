# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach('./seed_csvs/markets.csv', :headers => true) do |row|
    Market.create(row.to_hash)
end

CSV.foreach('./seed_csvs/vendors.csv', :headers => true) do |row|
    Vendor.create(row.to_hash)
end

CSV.foreach('./seed_csvs/products.csv', :headers => true) do |row|
    Product.create(row.to_hash)
end

CSV.foreach('./seed_csvs/sales.csv', :headers => true) do |row|
    Sale.create(row.to_hash)
end
