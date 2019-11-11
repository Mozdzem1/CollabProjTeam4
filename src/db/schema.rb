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

ActiveRecord::Schema.define(version: 2019_11_11_033322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "dashboards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorite_opportunities", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "opportunity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["opportunity_id"], name: "index_favorite_opportunities_on_opportunity_id"
    t.index ["user_id"], name: "index_favorite_opportunities_on_user_id"
  end

  create_table "favorite_organizations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_favorite_organizations_on_organization_id"
    t.index ["user_id"], name: "index_favorite_organizations_on_user_id"
  end

  create_table "issue_areas", force: :cascade do |t|
    t.string "name", limit: 75, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "opportunities", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name", limit: 50, null: false
    t.string "address", limit: 100, null: false
    t.string "city", limit: 100, null: false
    t.string "state", limit: 2, null: false
    t.string "zip_code", limit: 5, null: false
    t.boolean "transportation", null: false
    t.string "description", limit: 500
    t.string "frequency", limit: 50
    t.string "email", limit: 50, null: false
    t.bigint "issue_area_id"
    t.bigint "tag_id"
    t.boolean "approved", default: false
    t.date "on_date"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id", default: [], array: true
    t.index ["issue_area_id"], name: "index_opportunities_on_issue_area_id"
    t.index ["organization_id"], name: "index_opportunities_on_organization_id"
    t.index ["tag_id"], name: "index_opportunities_on_tag_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", limit: 75, null: false
    t.string "email", limit: 50, null: false
    t.string "phone_no", limit: 12, null: false
    t.string "address", limit: 100
    t.string "city", limit: 100
    t.string "state", limit: 2
    t.string "zip_code", limit: 5
    t.string "description", limit: 1000
    t.boolean "approved", default: false, null: false
    t.string "issue_area", limit: 500
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.boolean "approved", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tag_id"
    t.boolean "admin", default: false
    t.string "name", default: "Steve"
    t.string "address", default: "2000 Pennington Road"
    t.string "fav_event", default: [], array: true
    t.string "fav_org", default: [], array: true
    t.string "signed_up", default: [], array: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "favorite_opportunities", "opportunities"
  add_foreign_key "favorite_opportunities", "users"
  add_foreign_key "favorite_organizations", "organizations"
  add_foreign_key "favorite_organizations", "users"
  add_foreign_key "opportunities", "issue_areas"
  add_foreign_key "opportunities", "organizations"
  add_foreign_key "opportunities", "tags"
  add_foreign_key "organizations", "users"
  add_foreign_key "users", "tags"
end
