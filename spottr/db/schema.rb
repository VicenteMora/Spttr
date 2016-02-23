
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

ActiveRecord::Schema.define(version: 20160221061214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "match_associations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "match_associations", ["match_id"], name: "index_match_associations_on_match_id", using: :btree
  add_index "match_associations", ["user_id"], name: "index_match_associations_on_user_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.boolean  "isRejected"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["match_id"], name: "index_messages_on_match_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "gender",        default: "Male",         null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "fitness_level", default: "intermediate", null: false
    t.string   "gym"
    t.string   "availability",  default: "afternoon",    null: false
    t.integer  "user_id"
    t.boolean  "over_18"
    t.string   "headshot_url"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "match_associations", "matches"
  add_foreign_key "match_associations", "users"
  add_foreign_key "messages", "matches"
  add_foreign_key "messages", "users"
end
