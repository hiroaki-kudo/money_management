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

ActiveRecord::Schema.define(version: 2021_08_23_022700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "treasurer_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["treasurer_id"], name: "index_comments_on_treasurer_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "treasurer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["treasurer_id"], name: "index_favorites_on_treasurer_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "managements", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parent_id"
    t.bigint "kid_id"
    t.string "email"
    t.index ["email"], name: "index_managements_on_email", unique: true
    t.index ["kid_id"], name: "index_managements_on_kid_id"
    t.index ["parent_id"], name: "index_managements_on_parent_id"
  end

  create_table "treasurers", force: :cascade do |t|
    t.date "use_date_at"
    t.integer "category_id"
    t.string "use_what"
    t.integer "use_money", default: 0
    t.integer "get_money", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "management_id"
    t.index ["management_id"], name: "index_treasurers_on_management_id"
    t.index ["user_id"], name: "index_treasurers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "parent_or_child"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "comments", "treasurers"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "treasurers"
  add_foreign_key "favorites", "users"
  add_foreign_key "managements", "users", column: "kid_id"
  add_foreign_key "managements", "users", column: "parent_id"
  add_foreign_key "treasurers", "managements"
  add_foreign_key "treasurers", "users"
end
