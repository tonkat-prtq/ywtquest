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

ActiveRecord::Schema.define(version: 2020_05_07_111410) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dones", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.text "comment", default: "", null: false
    t.integer "worktime", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "log_id"
    t.index ["log_id"], name: "index_dones_on_log_id"
  end

  create_table "knowledges", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.text "comment", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "log_id"
    t.index ["log_id"], name: "index_knowledges_on_log_id"
  end

  create_table "logs", force: :cascade do |t|
    t.date "started_on", default: -> { "now()" }, null: false
    t.date "ended_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todos", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.date "when_to_do"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "log_id"
    t.index ["log_id"], name: "index_todos_on_log_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "provider", default: "", null: false
    t.string "uid", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.integer "totaltime", default: 0, null: false
    t.integer "level", default: 1, null: false
    t.integer "exp_point", default: 0, null: false
    t.text "profile", default: "", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "dones", "logs"
  add_foreign_key "knowledges", "logs"
  add_foreign_key "todos", "logs"
end
