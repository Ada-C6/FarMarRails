# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'


    farm_mrkt = []
    CSV.open('./seed_csvs/markets.csv', 'r'). each do |place|
      markets = {}
      markets[:id] = place[0].to_i
      markets[:name] = place[1]
      markets[:address] = place[2]
      markets[:city] = place[3]
      markets[:county] = place[4]
      markets[:state] = place[5]
      markets[:zip] = place[6]
      farm_mrkt << Market.create(markets)
    end
