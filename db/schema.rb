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

ActiveRecord::Schema.define(version: 20161130042922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auctions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "opening_time"
    t.datetime "closing_time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.string   "aasm_state"
    t.integer  "raised"
    t.index ["user_id"], name: "index_auctions_on_user_id", using: :btree
  end

  create_table "bids", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "listing_id"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_bids_on_listing_id", using: :btree
    t.index ["user_id"], name: "index_bids_on_user_id", using: :btree
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_favorites_on_listing_id", using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "listings", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "tier"
    t.string   "title"
    t.string   "description"
    t.integer  "reserve_price"
    t.integer  "guaranteed_price"
    t.integer  "winning_bid"
    t.integer  "winner_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_listings_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "organizations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.integer  "phone"
    t.string   "email"
    t.string   "website"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_organizations_on_user_id", using: :btree
  end

  create_table "tiers", force: :cascade do |t|
    t.integer  "auction_id"
    t.string   "name"
    t.text     "description"
    t.integer  "opening_time"
    t.integer  "closing_time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["auction_id"], name: "index_tiers_on_auction_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "display_name"
    t.integer  "phone"
    t.text     "address"
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "auctions", "users"
end
