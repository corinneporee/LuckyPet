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

ActiveRecord::Schema[7.0].define(version: 2022_12_05_160504) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.float "weight"
    t.date "date_of_birth"
    t.string "personality"
    t.string "gender"
    t.string "health"
    t.boolean "neutered"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dogs_on_user_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.string "status", default: "pending"
    t.bigint "dog_id", null: false
    t.bigint "buddy_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buddy_id"], name: "index_friendships_on_buddy_id"
    t.index ["dog_id"], name: "index_friendships_on_dog_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.bigint "dog_id", null: false
    t.bigint "walk_id", null: false
    t.string "message"
    t.string "status", default: "pending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dog_id"], name: "index_invitations_on_dog_id"
    t.index ["walk_id"], name: "index_invitations_on_walk_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dog_id", null: false
    t.bigint "spot_id", null: false
    t.index ["dog_id"], name: "index_reviews_on_dog_id"
    t.index ["spot_id"], name: "index_reviews_on_spot_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "adress"
    t.string "spot_type"
    t.string "vet_specialty"
    t.string "walk_environment"
    t.string "walk_area"
    t.string "walk_attendance"
    t.boolean "shop_cereale"
    t.boolean "shop_vrac"
    t.boolean "shop_insects"
    t.boolean "pension_pro"
    t.boolean "pension_walks"
    t.boolean "grooming_shop"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_spots_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "walks", force: :cascade do |t|
    t.bigint "spot_id", null: false
    t.bigint "dog_id", null: false
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dog_id"], name: "index_walks_on_dog_id"
    t.index ["spot_id"], name: "index_walks_on_spot_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "dogs", "users"
  add_foreign_key "friendships", "dogs"
  add_foreign_key "friendships", "dogs", column: "buddy_id"
  add_foreign_key "invitations", "dogs"
  add_foreign_key "invitations", "walks"
  add_foreign_key "reviews", "dogs"
  add_foreign_key "reviews", "spots"
  add_foreign_key "spots", "users"
  add_foreign_key "walks", "dogs"
  add_foreign_key "walks", "spots"
end
