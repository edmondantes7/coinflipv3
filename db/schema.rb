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

ActiveRecord::Schema.define(version: 20151018190408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coinflips", force: :cascade do |t|
    t.integer  "bet"
    t.integer  "balance"
    t.boolean  "coin_result"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "winning_flip"
  end

  add_index "coinflips", ["user_id"], name: "index_coinflips_on_user_id", using: :btree

  create_table "surveys", force: :cascade do |t|
    t.string   "test_for_response"
    t.string   "done_diff_response"
    t.boolean  "fam_with_response"
    t.boolean  "was_fair_response"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "surveys", ["user_id"], name: "index_surveys_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "profession"
    t.string   "education"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "balance"
  end

  add_foreign_key "coinflips", "users"
  add_foreign_key "surveys", "users"
end
