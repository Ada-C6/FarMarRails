# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach('seed_csvs/markets.csv', :headers => false) do |market|
  zip = market[6]
  if zip.nil?
  elsif zip.length == 4
    zip = "0#{zip}"
  end

  Market.create(id: market[0].to_i, name: market[1], address: market[2], city: market[3], county: market[4], state: market[5], zip: zip)
end

CSV.foreach('seed_csvs/vendors.csv', :headers => false) do |vendor|
  Vendor.create(id: vendor[0].to_i, name: vendor[1], num_of_employees: vendor[2].to_i, market_id: vendor[3].to_i)
end
