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

ActiveRecord::Schema.define(version: 2019_10_25_120945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "adding_track_to_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "track_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["track_id"], name: "index_adding_track_to_users_on_track_id"
    t.index ["user_id"], name: "index_adding_track_to_users_on_user_id"
  end

  create_table "adding_tracks", force: :cascade do |t|
    t.bigint "playlist_id"
    t.bigint "track_id"
    t.boolean "private", default: false
    t.index ["playlist_id"], name: "index_adding_tracks_on_playlist_id"
    t.index ["track_id"], name: "index_adding_tracks_on_track_id"
  end

  create_table "assessments", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "stars", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "track_playlist_type"
    t.bigint "track_playlist_id"
    t.index ["track_playlist_type", "track_playlist_id"], name: "index_assessments_on_track_playlist_type_and_track_playlist_id"
    t.index ["user_id"], name: "index_assessments_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.string "object_type"
    t.bigint "object_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["object_type", "object_id"], name: "index_comments_on_object_type_and_object_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "message"
    t.bigint "user_id"
    t.bigint "sender_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link"
    t.boolean "checked", default: false
    t.index ["sender_id"], name: "index_notifications_on_sender_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "playlist_subscriptions", force: :cascade do |t|
    t.bigint "playlist_id"
    t.bigint "user_id"
    t.index ["playlist_id"], name: "index_playlist_subscriptions_on_playlist_id"
    t.index ["user_id"], name: "index_playlist_subscriptions_on_user_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "private", default: false
    t.string "image"
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "playlists_tags", id: false, force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "playlist_id", null: false
    t.index ["playlist_id", "tag_id"], name: "index_playlists_tags_on_playlist_id_and_tag_id"
    t.index ["tag_id", "playlist_id"], name: "index_playlists_tags_on_tag_id_and_playlist_id"
  end

  create_table "room_messages", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "user_id"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_messages_on_room_id"
    t.index ["user_id"], name: "index_room_messages_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.boolean "private_messages", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.text "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "artist"
    t.string "name"
    t.string "album"
    t.string "release_date"
    t.json "provider_links"
    t.string "track_image"
  end

  create_table "user_subscriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "subscription_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscription_id"], name: "index_user_subscriptions_on_subscription_id"
    t.index ["user_id"], name: "index_user_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
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
    t.string "role", default: "user"
    t.string "provider"
    t.string "uid"
    t.string "nickname"
    t.string "avatar"
    t.string "date_birthday"
    t.string "address"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "adding_track_to_users", "tracks"
  add_foreign_key "adding_track_to_users", "users"
  add_foreign_key "adding_tracks", "playlists"
  add_foreign_key "adding_tracks", "tracks"
  add_foreign_key "assessments", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "notifications", "users", column: "sender_id"
  add_foreign_key "playlist_subscriptions", "playlists"
  add_foreign_key "playlist_subscriptions", "users"
  add_foreign_key "playlists", "users"
  add_foreign_key "room_messages", "rooms"
  add_foreign_key "room_messages", "users"
  add_foreign_key "user_subscriptions", "users"
  add_foreign_key "user_subscriptions", "users", column: "subscription_id"
end
