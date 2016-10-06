ai# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.read("/Users/madeleinejohnson/Ada/project-forks/Rails/FarMarRails/seed_csvs/markets.csv").each do |t|
  Market.create(id: t[0], name: t[1], address: t[2], city: t[3], county: t[4], state: t[5], zip:t [6])
end

CSV.read("/Users/madeleinejohnson/Ada/project-forks/Rails/FarMarRails/seed_csvs/vendors.csv").each do |s|
  Vendor.create(id: s[0], name: s[1], employees: s[2], market_id: s[3])
end

CSV.read("/Users/madeleinejohnson/Ada/project-forks/Rails/FarMarRails/seed_csvs/products.csv").each do |s|
  Product.create(id: s[0], name: s[1], vendor_id: s[2])
end

CSV.read("/Users/madeleinejohnson/Ada/project-forks/Rails/FarMarRails/seed_csvs/sales.csv").each do |s|
  Sale.create(id: s[0], amount: s[1], time: s[2], vendor_id: s[3], product_id: s[4])
end
