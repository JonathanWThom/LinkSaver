# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_30_052546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "link_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_categories_on_link_id"
    t.index ["tag_id"], name: "index_categories_on_tag_id"
  end

  create_table "links", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "favorite", default: false
    t.boolean "public", default: false
    t.string "encrypted_address"
    t.string "encrypted_address_iv"
    t.string "encrypted_html"
    t.string "encrypted_html_iv"
    t.string "encrypted_page_title"
    t.string "encrypted_page_title_iv"
    t.string "tmp_address"
    t.text "tmp_html"
    t.string "tmp_page_title"
    t.index ["created_at"], name: "index_links_on_created_at"
    t.index ["favorite"], name: "index_links_on_favorite"
    t.index ["public"], name: "index_links_on_public"
    t.index ["updated_at"], name: "index_links_on_updated_at"
    t.index ["user_id"], name: "index_links_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
    t.integer "user_id"
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.boolean "delete_links", default: false
    t.string "display_name"
    t.string "slug"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
    t.index ["slug"], name: "index_users_on_slug"
  end

  add_foreign_key "tags", "users"
end
