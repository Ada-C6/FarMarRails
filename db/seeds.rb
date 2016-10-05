require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Market seed
CSV.read("seed_csvs/markets.csv").each do |line|
  # TODO: We can refactor to use a hash here, but this works for now.

  id, name, address, city, county, state, zip = line # parallel assignment!

  id = id.to_i # need id to be a fixnum

  market = Market.new(id: id, name: name, street_address: address, city: city, county: county, state: state, zip_code: zip)

  market.save
end

# Vendor seed
CSV.read("seed_csvs/vendors.csv").each do |line|
  id, name, num_employees, market_id = line # parallel assignment!
  id = id.to_i # need id to be a fixnum
  num_employees = num_employees.to_i # want num_employees to be a fixnum also
  market_id = market_id.to_i #want market_id to be a fixnum
  vendor = Vendor.new(id: id, market_id: market_id, name: name, num_employees:num_employees)

  vendor.save
end

# Products seed
CSV.read("seed_csvs/products.csv").each do |line|
      id, product_name, vendor_id = line # parallel assignment!
      id = id.to_i # need product_id to be a fixnum
      vendor_id = vendor_id.to_i #want vendor_id to be a fixnum

      product =  Product.new(id: id, vendor_id: vendor_id, name: product_name)

      product.save
    end

# Sales seed
CSV.read("seed_csvs/sales.csv").each do |line|
  id, amount, purchase_time, vendor_id, product_id = line # parallel assignment!
  id = id.to_i # need sale_id to be a fixnum
  amount = amount.to_i # want amount to be a fixnum also
  vendor_id = vendor_id.to_i # want vendor_id to be a fixnum
  product_id = product_id.to_i # want product_id also to be a fixnum
  purchase_time = DateTime.parse(purchase_time) #convert purchase_time string to a DateTime object.

  sale = Sale.new(id: id, amount: amount, purchase_time: purchase_time, vendor_id: vendor_id, product_id: product_id)
  
  sale.save
end
