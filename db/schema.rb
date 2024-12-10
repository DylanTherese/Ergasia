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

ActiveRecord::Schema[8.0].define(version: 2024_12_08_170358) do
  create_table "bookings", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.decimal "total_price"
    t.integer "workspace_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bookings_on_user_id"
    t.index ["workspace_id"], name: "index_bookings_on_workspace_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workspaces", force: :cascade do |t|
    t.string "title"
    t.decimal "latitude"
    t.decimal "longitude"
    t.string "contact"
    t.integer "price_per_day"
    t.time "check_in_time"
    t.date "check_in_date"
    t.time "check_out_time"
    t.date "check_out_date"
    t.text "description"
    t.string "address"
    t.integer "max_guests"
    t.integer "bedrooms"
    t.integer "office"
    t.integer "bath"
    t.boolean "pet_allowed"
    t.integer "wifi_speed"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_workspaces_on_user_id"
  end

  add_foreign_key "bookings", "users"
  add_foreign_key "bookings", "workspaces"
  add_foreign_key "workspaces", "users"
end
