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

ActiveRecord::Schema[7.1].define(version: 2026_06_22_083150) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cima_medications", force: :cascade do |t|
    t.string "nregistro", null: false
    t.string "name", null: false
    t.string "normalized_name"
    t.text "active_ingredients_text"
    t.string "laboratory_holder_name"
    t.string "prescription_conditions"
    t.string "dose"
    t.string "authorization_status", default: "unknown", null: false
    t.date "authorized_on"
    t.date "suspended_on"
    t.date "revoked_on"
    t.boolean "commercialized", default: false, null: false
    t.boolean "requires_prescription"
    t.boolean "affects_driving"
    t.boolean "black_triangle"
    t.boolean "orphan_medicine"
    t.boolean "biosimilar"
    t.boolean "ema_authorized"
    t.boolean "has_supply_problem", default: false, null: false
    t.boolean "has_notes", default: false, null: false
    t.boolean "has_safety_materials", default: false, null: false
    t.datetime "source_first_seen_at"
    t.datetime "source_last_seen_at"
    t.datetime "last_synced_at"
    t.string "last_seen_batch_id"
    t.string "payload_hash"
    t.datetime "deprecated_at"
    t.string "deprecated_reason"
    t.integer "import_error_count", default: 0, null: false
    t.text "last_import_error"
    t.datetime "last_import_error_at"
    t.jsonb "raw_payload", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authorization_status"], name: "index_cima_medications_on_authorization_status"
    t.index ["commercialized"], name: "index_cima_medications_on_commercialized"
    t.index ["deprecated_at"], name: "index_cima_medications_on_deprecated_at"
    t.index ["has_supply_problem"], name: "index_cima_medications_on_has_supply_problem"
    t.index ["laboratory_holder_name"], name: "index_cima_medications_on_laboratory_holder_name"
    t.index ["last_seen_batch_id"], name: "index_cima_medications_on_last_seen_batch_id"
    t.index ["name"], name: "index_cima_medications_on_name"
    t.index ["normalized_name"], name: "index_cima_medications_on_normalized_name"
    t.index ["nregistro"], name: "index_cima_medications_on_nregistro", unique: true
    t.index ["payload_hash"], name: "index_cima_medications_on_payload_hash"
    t.index ["requires_prescription"], name: "index_cima_medications_on_requires_prescription"
  end

  create_table "roles", force: :cascade do |t|
    t.string "code", null: false
    t.string "description", null: false
    t.boolean "admin", default: false, null: false
    t.boolean "user", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_roles_on_code", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "login", null: false
    t.string "password_digest", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login"], name: "index_users_on_login", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "users", "roles"
end
