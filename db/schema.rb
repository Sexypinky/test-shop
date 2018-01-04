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

ActiveRecord::Schema.define(version: 20171228093549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dengi", default: 0
    t.integer "nomer"
    t.integer "password"
  end

  create_table "cards", force: :cascade do |t|
    t.string "cc", default: ""
    t.string "country", default: ""
    t.boolean "full_cc", default: false
    t.boolean "not_full", default: false
    t.boolean "with_vbv", default: false
    t.boolean "without_vbv", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "price"
    t.integer "buyer_id", default: 0
  end

  create_table "checkbanks", force: :cascade do |t|
    t.integer "nomer", null: false
    t.integer "password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "chelid"
  end

  create_table "chels", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["confirmation_token"], name: "index_chels_on_confirmation_token", unique: true
    t.index ["email"], name: "index_chels_on_email", unique: true
    t.index ["reset_password_token"], name: "index_chels_on_reset_password_token", unique: true
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "author_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id", "receiver_id"], name: "index_conversations_on_author_id_and_receiver_id", unique: true
    t.index ["author_id"], name: "index_conversations_on_author_id"
    t.index ["receiver_id"], name: "index_conversations_on_receiver_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "page_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_taggings_on_page_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "nomer"
    t.integer "summa"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "nomerto"
    t.integer "nomerfrom"
  end

  add_foreign_key "taggings", "pages"
  add_foreign_key "taggings", "tags"
end
