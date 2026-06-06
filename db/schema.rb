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

ActiveRecord::Schema[8.0].define(version: 2026_06_06_171830) do
  create_table "diesel_transactions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "vehicle_id", null: false
    t.bigint "work_table_id", null: false
    t.bigint "added_by_id", null: false
    t.date "date"
    t.decimal "liters", precision: 10
    t.decimal "cost", precision: 10
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["added_by_id"], name: "index_diesel_transactions_on_added_by_id"
    t.index ["vehicle_id"], name: "index_diesel_transactions_on_vehicle_id"
    t.index ["work_table_id"], name: "index_diesel_transactions_on_work_table_id"
  end

  create_table "drivers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "mobile_no"
    t.text "address"
    t.string "license_no"
    t.integer "experience_years"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parties", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "phone_no"
    t.text "address"
    t.string "gst_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "mobile_no"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["mobile_no"], name: "index_users_on_mobile_no", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "vehicle_no", null: false
    t.integer "vehicle_type", null: false
    t.string "display_name"
    t.integer "capacity"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_no"], name: "index_vehicles_on_vehicle_no", unique: true
  end

  create_table "work_tables", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "vehicle_id", null: false
    t.bigint "driver_id", null: false
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.string "from_location"
    t.string "to_location"
    t.string "material"
    t.bigint "party_id", null: false
    t.string "work_location"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_work_tables_on_driver_id"
    t.index ["party_id"], name: "index_work_tables_on_party_id"
    t.index ["vehicle_id"], name: "index_work_tables_on_vehicle_id"
  end

  add_foreign_key "diesel_transactions", "users", column: "added_by_id"
  add_foreign_key "diesel_transactions", "vehicles"
  add_foreign_key "diesel_transactions", "work_tables"
  add_foreign_key "work_tables", "drivers"
  add_foreign_key "work_tables", "parties"
  add_foreign_key "work_tables", "vehicles"
end
