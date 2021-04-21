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

ActiveRecord::Schema.define(version: 2021_04_21_013651) do

  create_table "ads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "banner"
    t.string "uri"
    t.integer "order"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ads_on_user_id"
  end

  create_table "collections", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "sheet_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sheet_id", "user_id"], name: "index_collections_on_sheet_id_and_user_id", unique: true
    t.index ["sheet_id"], name: "index_collections_on_sheet_id"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "labels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "sheet_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sheet_id"], name: "index_labels_on_sheet_id"
    t.index ["tag_id", "sheet_id", "user_id"], name: "index_labels_on_tag_id_and_sheet_id_and_user_id", unique: true
    t.index ["tag_id"], name: "index_labels_on_tag_id"
    t.index ["user_id"], name: "index_labels_on_user_id"
  end

  create_table "relations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "song_id"
    t.bigint "sheet_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sheet_id"], name: "index_relations_on_sheet_id"
    t.index ["song_id", "sheet_id", "user_id"], name: "index_relations_on_song_id_and_sheet_id_and_user_id", unique: true
    t.index ["song_id"], name: "index_relations_on_song_id"
    t.index ["user_id"], name: "index_relations_on_user_id"
  end

  create_table "sheets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "banner"
    t.string "description"
    t.integer "clicks_count"
    t.integer "collections_count"
    t.integer "comments_count"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sheets_on_user_id"
  end

  create_table "songs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.string "banner"
    t.string "uri"
    t.integer "clicks_count"
    t.integer "comments_count"
    t.integer "style"
    t.text "lyric"
    t.bigint "user_id"
    t.integer "singer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_songs_on_user_id"
  end

  create_table "tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.bigint "parent_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_tags_on_parent_id"
    t.index ["title", "user_id"], name: "index_tags_on_title_and_user_id", unique: true
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

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
    t.string "code"
    t.datetime "code_sent_at"
    t.string "push"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["qq_id"], name: "index_users_on_qq_id", unique: true
    t.index ["wechat_id"], name: "index_users_on_wechat_id", unique: true
  end

  create_table "videos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.string "uri", null: false
    t.string "banner", null: false
    t.integer "duration", default: 0, null: false
    t.bigint "user_id"
    t.integer "clicks_count", default: 0, null: false
    t.integer "comments_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_videos_on_user_id"
  end

  add_foreign_key "ads", "users"
  add_foreign_key "collections", "sheets"
  add_foreign_key "collections", "users"
  add_foreign_key "labels", "sheets"
  add_foreign_key "labels", "tags"
  add_foreign_key "labels", "users"
  add_foreign_key "relations", "sheets"
  add_foreign_key "relations", "songs"
  add_foreign_key "relations", "users"
  add_foreign_key "sheets", "users"
  add_foreign_key "songs", "users"
  add_foreign_key "tags", "users"
  add_foreign_key "videos", "users"
end
