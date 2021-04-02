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

ActiveRecord::Schema.define(version: 2021_04_01_120152) do

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "avatar"
    t.string "description"
    t.integer "gender", default: 0, null: false
    t.date "birthday"
    t.string "email", null: false
    t.string "phone", null: false
    t.string "password_digest", null: false
    t.string "session_digest"
    t.string "reset_password_digest"
    t.datetime "reset_password_sent_at"
    t.string "confirmation_digest"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "qq_id", limit: 191
    t.string "qq_id_digest"
    t.string "wechat_id", limit: 191
    t.string "wechat_id_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["qq_id"], name: "index_users_on_qq_id", unique: true
    t.index ["wechat_id"], name: "index_users_on_wechat_id", unique: true
  end

end