# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.read('seed_csvs/markets.csv').each do |line|
  market = {}
  market[:name] = line[1]
  market[:address] = line[2]
  market[:city] = line[3]
  market[:county] = line[4]
  market[:state] = line[5]
  market[:zip] = line[6]

  Market.create(market)

end
