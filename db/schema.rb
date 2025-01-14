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

ActiveRecord::Schema[7.0].define(version: 2021_10_12_195819) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "custom_fields", force: :cascade do |t|
    t.bigint "help_request_kind_id", null: false
    t.string "name", null: false
    t.string "data_type", default: "string", null: false
    t.hstore "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "public_field", default: false
    t.index ["help_request_kind_id"], name: "index_custom_fields_on_help_request_kind_id"
  end

  create_table "custom_values", force: :cascade do |t|
    t.text "value"
    t.bigint "help_request_id", null: false
    t.bigint "custom_field_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["custom_field_id"], name: "index_custom_values_on_custom_field_id"
    t.index ["help_request_id"], name: "index_custom_values_on_help_request_id"
  end

  create_table "help_request_kinds", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "default", default: false, null: false
    t.index ["organization_id"], name: "index_help_request_kinds_on_organization_id"
  end

  create_table "help_request_logs", force: :cascade do |t|
    t.text "comment"
    t.bigint "help_request_id", null: false
    t.integer "kind", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["help_request_id"], name: "index_help_request_logs_on_help_request_id"
    t.index ["user_id"], name: "index_help_request_logs_on_user_id"
  end

  create_table "help_requests", force: :cascade do |t|
    t.string "lonlat"
    t.string "phone"
    t.integer "state", default: 0
    t.text "comment"
    t.string "person"
    t.boolean "mediated", default: false, null: false
    t.boolean "meds_preciption_required"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "volunteer_id"
    t.string "city"
    t.string "district"
    t.string "street"
    t.string "house"
    t.string "apartment"
    t.bigint "organization_id"
    t.string "lonlat_with_salt"
    t.string "number"
    t.date "schedule_set_at"
    t.integer "period"
    t.boolean "recurring"
    t.integer "help_request_kind_id"
    t.integer "score", default: 1, null: false
    t.datetime "date_begin", precision: nil
    t.datetime "date_end", precision: nil
    t.string "title", limit: 140
    t.date "activated_at"
    t.integer "creator_id"
    t.index ["organization_id"], name: "index_help_requests_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "title", null: false
    t.string "country"
    t.string "city"
    t.string "site"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "archive", default: false
    t.boolean "test", default: false
    t.jsonb "config", default: {}
  end

  create_table "reports", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name"
    t.hstore "condition"
    t.string "document"
    t.integer "state", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_reports_on_organization_id"
  end

  create_table "settings", force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["var"], name: "index_settings_on_var", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.integer "old_role", default: 0, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at", precision: nil
    t.datetime "invitation_sent_at", precision: nil
    t.datetime "invitation_accepted_at", precision: nil
    t.integer "invitation_limit"
    t.integer "invited_by_id"
    t.string "invited_by_type"
    t.bigint "organization_id"
    t.string "name"
    t.string "surname"
    t.string "phone"
    t.integer "score", default: 0, null: false
    t.string "device_token"
    t.string "device_platform"
    t.hstore "roles"
    t.integer "sex"
    t.string "app_version"
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: nil
    t.datetime "confirmation_sent_at", precision: nil
    t.string "unconfirmed_email"
    t.integer "status", default: 0
    t.boolean "policy_confirmed"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "help_requests", "organizations"
  add_foreign_key "users", "organizations"
end
