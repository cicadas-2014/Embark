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

ActiveRecord::Schema.define(version: 20140708134211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adventure_categories", force: true do |t|
    t.integer  "category_id"
    t.integer  "adventure_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "adventures", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "duration"
    t.text     "map_url"
    t.text     "image_url"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "name"
    t.string   "longitude"
    t.string   "latitude"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "continents", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "continent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorited_adventures", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.string   "panoramio_id"
    t.text     "original_image_url"
    t.text     "medium_image_url"
    t.text     "smaal_image_url"
    t.string   "longitude"
    t.string   "latitude"
    t.boolean  "confirmed",          default: false
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin?",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
