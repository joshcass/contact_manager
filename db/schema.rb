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

ActiveRecord::Schema.define(version: 20150609022118) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id", using: :btree

  create_table "email_addresses", force: :cascade do |t|
    t.text     "address"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "contact_id"
    t.string   "contact_type"
  end

  add_index "email_addresses", ["contact_type", "contact_id"], name: "index_email_addresses_on_contact_type_and_contact_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.text     "first_name"
    t.text     "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "people", ["user_id"], name: "index_people_on_user_id", using: :btree

  create_table "phone_numbers", force: :cascade do |t|
    t.text     "number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "contact_id"
    t.string   "contact_type"
  end

  add_index "phone_numbers", ["contact_type", "contact_id"], name: "index_phone_numbers_on_contact_type_and_contact_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.text     "provider"
    t.text     "uid"
    t.string   "name"
    t.text     "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "companies", "users"
  add_foreign_key "people", "users"
end
