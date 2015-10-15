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

ActiveRecord::Schema.define(version: 20151014221612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contracts", force: :cascade do |t|
    t.float    "total"
    t.integer  "couple_id"
    t.integer  "vendor_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "couple_pending", default: true
    t.boolean  "vendor_pending", default: true
  end

  create_table "couples", force: :cascade do |t|
    t.text     "description"
    t.string   "player1"
    t.string   "player2"
    t.string   "wedding_date"
    t.float    "budget"
    t.string   "ceremony_location"
    t.string   "reception_location"
    t.string   "email",                      default: "", null: false
    t.string   "encrypted_password",         default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",              default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "couple_avatar_file_name"
    t.string   "couple_avatar_content_type"
    t.integer  "couple_avatar_file_size"
    t.datetime "couple_avatar_updated_at"
  end

  add_index "couples", ["email"], name: "index_couples_on_email", unique: true, using: :btree
  add_index "couples", ["provider"], name: "index_couples_on_provider", using: :btree
  add_index "couples", ["reset_password_token"], name: "index_couples_on_reset_password_token", unique: true, using: :btree
  add_index "couples", ["uid"], name: "index_couples_on_uid", using: :btree

  create_table "families", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "contact"
    t.string   "role"
    t.string   "relation"
    t.integer  "couple_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "type"
    t.string   "address"
    t.string   "website"
    t.string   "phone"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "email",                      default: "", null: false
    t.string   "encrypted_password",         default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",              default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.string   "vendor_avatar_file_name"
    t.string   "vendor_avatar_content_type"
    t.integer  "vendor_avatar_file_size"
    t.datetime "vendor_avatar_updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "vendors", ["email"], name: "index_vendors_on_email", unique: true, using: :btree
  add_index "vendors", ["provider"], name: "index_vendors_on_provider", using: :btree
  add_index "vendors", ["reset_password_token"], name: "index_vendors_on_reset_password_token", unique: true, using: :btree
  add_index "vendors", ["uid"], name: "index_vendors_on_uid", using: :btree

end
