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

ActiveRecord::Schema.define(version: 2018_09_04_152054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_screens", force: :cascade do |t|
    t.string "url"
    t.string "description"
    t.bigint "app_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_app_screens_on_app_id"
  end

  create_table "app_tags", force: :cascade do |t|
    t.bigint "app_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_app_tags_on_app_id"
    t.index ["tag_id"], name: "index_app_tags_on_tag_id"
  end

  create_table "apps", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "logo"
    t.string "webpage_url"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "integrated", default: false, null: false
    t.index ["category_id"], name: "index_apps_on_category_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "app_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_bookmarks_on_app_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon"
    t.string "icon_hover"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "app_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_reviews_on_app_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "username"
    t.string "public_token"
    t.string "google_access_code"
    t.string "google_access_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "app_screens", "apps"
  add_foreign_key "app_tags", "apps"
  add_foreign_key "app_tags", "tags"
  add_foreign_key "apps", "categories"
  add_foreign_key "bookmarks", "apps"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "reviews", "apps"
  add_foreign_key "reviews", "users"
end
