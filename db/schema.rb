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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130708021757) do

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "neighborhoods", :force => true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "office_listings", :force => true do |t|
    t.string   "address"
    t.string   "office_type"
    t.integer  "size"
    t.integer  "rent"
    t.text     "details"
    t.boolean  "kitchen"
    t.boolean  "reception"
    t.boolean  "light"
    t.boolean  "shower"
    t.boolean  "move_in"
    t.boolean  "high_ceiling"
    t.boolean  "patio"
    t.boolean  "furniture"
    t.string   "term_length"
    t.string   "availability"
    t.integer  "no_of_offices"
    t.integer  "no_of_conference_rooms"
    t.integer  "neighborhood_id"
    t.integer  "broker_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

end
