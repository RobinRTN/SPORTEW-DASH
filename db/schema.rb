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

ActiveRecord::Schema[7.0].define(version: 2023_02_03_122525) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "sport_id", null: false
    t.string "payment_status"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_bookings_on_sport_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "payment_IBAN"
    t.string "payment_BIC"
    t.string "billing_address_line1"
    t.string "billing_address_line2"
    t.string "billing_zip_code"
    t.string "billing_city"
    t.string "billing_country"
    t.string "first_name"
    t.string "last_name"
    t.string "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients_bookings", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "booking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_clients_bookings_on_booking_id"
    t.index ["client_id"], name: "index_clients_bookings_on_client_id"
  end

  create_table "clients_sports", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "sport_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_clients_sports_on_client_id"
    t.index ["sport_id"], name: "index_clients_sports_on_sport_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "full_name"
    t.string "uid"
    t.string "avatar_url"
    t.string "provider"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "coach"
    t.string "payment_IBAN"
    t.string "payment_BIC"
    t.string "billing_address_line1"
    t.string "billing_address_line2"
    t.string "billing_zip_code"
    t.string "billing_city"
    t.string "billing_country"
    t.string "first_name"
    t.string "last_name"
    t.float "hourly_rate"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "booking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_users_bookings_on_booking_id"
    t.index ["user_id"], name: "index_users_bookings_on_user_id"
  end

  create_table "users_sports", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "sport_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_users_sports_on_sport_id"
    t.index ["user_id"], name: "index_users_sports_on_user_id"
  end

  add_foreign_key "bookings", "sports"
  add_foreign_key "clients_bookings", "bookings"
  add_foreign_key "clients_bookings", "clients"
  add_foreign_key "clients_sports", "clients"
  add_foreign_key "clients_sports", "sports"
  add_foreign_key "users_bookings", "bookings"
  add_foreign_key "users_bookings", "users"
  add_foreign_key "users_sports", "sports"
  add_foreign_key "users_sports", "users"
end
