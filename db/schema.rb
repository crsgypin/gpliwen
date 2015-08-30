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

ActiveRecord::Schema.define(version: 20150830014811) do

  create_table "account_records", force: :cascade do |t|
    t.date     "account_date"
    t.string   "location"
    t.string   "note"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "account_values", force: :cascade do |t|
    t.integer  "account_record_id"
    t.integer  "cost"
    t.string   "description"
    t.integer  "first_category_id"
    t.integer  "second_category_id"
    t.integer  "third_category_id"
    t.integer  "from_account_id"
    t.integer  "to_account_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "account_values", ["account_record_id"], name: "index_account_values_on_account_record_id"
  add_index "account_values", ["first_category_id"], name: "index_account_values_on_first_category_id"
  add_index "account_values", ["from_account_id"], name: "index_account_values_on_from_account_id"
  add_index "account_values", ["second_category_id"], name: "index_account_values_on_second_category_id"
  add_index "account_values", ["third_category_id"], name: "index_account_values_on_third_category_id"
  add_index "account_values", ["to_account_id"], name: "index_account_values_on_to_account_id"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "owner_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "accounts", ["owner_id"], name: "index_accounts_on_owner_id"

  create_table "first_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "second_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "first_category_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "second_categories", ["first_category_id"], name: "index_second_categories_on_first_category_id"

  create_table "third_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "second_categories"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "third_categories", ["second_categories"], name: "index_third_categories_on_second_categories"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "username"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
