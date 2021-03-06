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

ActiveRecord::Schema.define(version: 20140327143241) do

  create_table "furcons", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "location"
    t.string   "theme"
    t.date     "starts_on"
    t.date     "ends_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "charities"
    t.string   "guest_of_honor"
    t.date     "prereg_by"
    t.string   "image_file_name"
    t.string   "slug"
  end

  create_table "memberships", force: true do |t|
    t.string   "name"
    t.string   "swag"
    t.decimal  "prereg_fee"
    t.decimal  "reg_fee"
    t.integer  "furcon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["furcon_id"], name: "index_memberships_on_furcon_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "admin",           default: false
    t.string   "slug"
  end

end
