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

ActiveRecord::Schema.define(version: 20130802195529) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: true do |t|
    t.integer  "viewing_id"
    t.integer  "renter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brokers", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.text     "address"
    t.string   "phone_number"
    t.string   "img_url"
    t.string   "firm"
  end

  add_index "brokers", ["email"], name: "index_brokers_on_email", unique: true, using: :btree
  add_index "brokers", ["reset_password_token"], name: "index_brokers_on_reset_password_token", unique: true, using: :btree

  create_table "cities", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "img"
  end

  create_table "favorites", force: true do |t|
    t.integer  "renter_id"
    t.integer  "office_listing_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "images", force: true do |t|
    t.text     "image"
    t.integer  "office_listing_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "link_image"
  end

  create_table "neighborhoods", force: true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "img_url"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "address"
  end

  create_table "notifications", force: true do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "office_listing_id"
    t.boolean  "read"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "broker_id"
    t.integer  "renter_id"
  end

  create_table "office_listings", force: true do |t|
    t.string   "address"
    t.string   "office_type"
    t.integer  "size"
    t.integer  "rent"
    t.text     "details"
    t.boolean  "kitchen",                default: false
    t.boolean  "reception",              default: false
    t.boolean  "light",                  default: false
    t.boolean  "shower",                 default: false
    t.boolean  "move_in",                default: false
    t.boolean  "high_ceiling",           default: false
    t.boolean  "patio",                  default: false
    t.boolean  "furniture",              default: false
    t.string   "term_length"
    t.string   "availability"
    t.integer  "no_of_offices"
    t.integer  "no_of_conference_rooms"
    t.integer  "neighborhood_id"
    t.integer  "broker_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "renters", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.text     "address"
    t.string   "phone_number"
    t.string   "img_url"
  end

  add_index "renters", ["email"], name: "index_renters_on_email", unique: true, using: :btree
  add_index "renters", ["reset_password_token"], name: "index_renters_on_reset_password_token", unique: true, using: :btree

  create_table "viewings", force: true do |t|
    t.integer  "office_listing_id"
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
