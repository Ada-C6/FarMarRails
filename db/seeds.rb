# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.read("../seed_csvs/markets.csv").each do |t|
  Market.create(id: t[0], name: t[1], address: t[2], city: t[3], county: t[4], state: t[5], zip:t [6])
end
