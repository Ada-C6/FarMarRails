# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# for markets:

markets = []

CSV.read('/../../seed_csvs/markets.csv').map do |line|
  market_hash = {}
  market_hash[:name] = line[1]
  market_hash[:address] = line[2]
  market_hash[:city] = line[3]
  market_hash[:state] = line[4]
  market_hash[:zip] = line[5]
  markets << market_hash
end

markets.each do |market_hash|
  Market.create(market_hash)
end



# CSV.read('/../../seed_csvs/markets.csv').map do |line|
#   market_hash = {
#     #id: line[0].to_i,
#     name: line[1],
#     address:line[2],
#     city: line[3],
#     county: line[4],
#     state: line[5],
#     zip: line[6]
#   }
#   Market.create(market_hash)
# end
