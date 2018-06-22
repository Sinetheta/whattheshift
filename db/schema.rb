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

ActiveRecord::Schema.define(version: 2018_06_21_180135) do

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

  create_table "comparison_image_diffs", force: :cascade do |t|
    t.bigint "comparison_id"
    t.bigint "image_diff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comparison_id"], name: "index_comparison_image_diffs_on_comparison_id"
    t.index ["image_diff_id"], name: "index_comparison_image_diffs_on_image_diff_id"
  end

  create_table "comparisons", force: :cascade do |t|
    t.bigint "from_revision_id"
    t.bigint "to_revision_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_revision_id"], name: "index_comparisons_on_from_revision_id"
    t.index ["to_revision_id"], name: "index_comparisons_on_to_revision_id"
  end

  create_table "image_diffs", force: :cascade do |t|
    t.bigint "before_image_id"
    t.bigint "after_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["after_image_id"], name: "index_image_diffs_on_after_image_id"
    t.index ["before_image_id"], name: "index_image_diffs_on_before_image_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "identifier"
    t.string "signature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images_revisions", id: false, force: :cascade do |t|
    t.bigint "revision_id", null: false
    t.bigint "image_id", null: false
    t.index ["image_id"], name: "index_images_revisions_on_image_id"
    t.index ["revision_id"], name: "index_images_revisions_on_revision_id"
  end

  create_table "revisions", force: :cascade do |t|
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comparison_image_diffs", "comparisons"
  add_foreign_key "comparison_image_diffs", "image_diffs"
  add_foreign_key "comparisons", "revisions", column: "from_revision_id"
  add_foreign_key "comparisons", "revisions", column: "to_revision_id"
  add_foreign_key "image_diffs", "images", column: "after_image_id"
  add_foreign_key "image_diffs", "images", column: "before_image_id"
end
