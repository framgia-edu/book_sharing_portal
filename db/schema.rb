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

ActiveRecord::Schema.define(version: 2018_10_15_234932) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.string "introduce"
    t.string "cover"
    t.string "content", default: "", null: false
    t.integer "quantity"
    t.integer "status", default: 2, null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "borrows", force: :cascade do |t|
    t.date "borrow_at"
    t.date "deadline_at"
    t.integer "status", default: 0, null: false
    t.bigint "user_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_borrows_on_book_id"
    t.index ["user_id"], name: "index_borrows_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interactions", force: :cascade do |t|
    t.integer "rating", default: 0, null: false
    t.string "comment", default: "", null: false
    t.string "type", null: false
    t.bigint "user_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_interactions_on_book_id"
    t.index ["user_id"], name: "index_interactions_on_user_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "listable_type"
    t.bigint "listable_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_lists_on_book_id"
    t.index ["listable_id", "listable_type"], name: "index_lists_on_listable_id_and_listable_type"
    t.index ["listable_type", "listable_id"], name: "index_lists_on_listable_type_and_listable_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "avatar"
    t.string "address"
    t.string "introduction"
    t.integer "status", default: 0, null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "provider"
    t.string "uid"
    t.boolean "admin", default: false, null: false
    t.string "remote_avatar"
    t.index ["confirmation_token"], name: "index_people_on_confirmation_token", unique: true
    t.index ["email"], name: "index_people_on_email", unique: true
    t.index ["reset_password_token"], name: "index_people_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_people_on_unlock_token", unique: true
  end

end
