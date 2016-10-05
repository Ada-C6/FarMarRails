# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20161005171938) do

  create_table "market_vendor_cleans", force: :cascade do |t|
    t.integer  "market_id"
    t.integer  "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "market_vendor_cleans", ["market_id"], name: "index_market_vendor_cleans_on_market_id"
  add_index "market_vendor_cleans", ["vendor_id"], name: "index_market_vendor_cleans_on_vendor_id"
=======
ActiveRecord::Schema.define(version: 20161005002316) do
>>>>>>> fe06481ec20490d788eae1ee45dd70bd1ffe52e2

  create_table "market_vendors", force: :cascade do |t|
    t.integer  "markets_id"
    t.integer  "vendors_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "market_vendors", ["markets_id"], name: "index_market_vendors_on_markets_id"
  add_index "market_vendors", ["vendors_id"], name: "index_market_vendors_on_vendors_id"

  create_table "markets", force: :cascade do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "county"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "amount"
    t.datetime "purchase_time"
    t.integer  "vendor_id"
    t.integer  "product_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string   "name"
    t.integer  "num_employees"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
