# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_10_143435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "extwebsite_fonts", force: :cascade do |t|
    t.bigint "font_id", null: false
    t.bigint "extwebsite_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["extwebsite_id"], name: "index_extwebsite_fonts_on_extwebsite_id"
    t.index ["font_id"], name: "index_extwebsite_fonts_on_font_id"
  end

  create_table "extwebsites", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "font_categories", force: :cascade do |t|
    t.bigint "font_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_font_categories_on_category_id"
    t.index ["font_id"], name: "index_font_categories_on_font_id"
  end

  create_table "font_types", force: :cascade do |t|
    t.bigint "font_id", null: false
    t.bigint "type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["font_id"], name: "index_font_types_on_font_id"
    t.index ["type_id"], name: "index_font_types_on_type_id"
  end

  create_table "fonts", force: :cascade do |t|
    t.string "name"
    t.boolean "free_personal", default: false
    t.boolean "free_commercial", default: false
    t.string "designer"
    t.string "source"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "post_fonts", force: :cascade do |t|
    t.bigint "font_id", null: false
    t.bigint "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["font_id"], name: "index_post_fonts_on_font_id"
    t.index ["post_id"], name: "index_post_fonts_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "website"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "extwebsite_fonts", "extwebsites"
  add_foreign_key "extwebsite_fonts", "fonts"
  add_foreign_key "font_categories", "categories"
  add_foreign_key "font_categories", "fonts"
  add_foreign_key "font_types", "fonts"
  add_foreign_key "font_types", "types"
  add_foreign_key "post_fonts", "fonts"
  add_foreign_key "post_fonts", "posts"
end
