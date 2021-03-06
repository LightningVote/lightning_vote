# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150106231904) do

  create_table "event_talks", force: :cascade do |t|
    t.integer  "talk_id"
    t.integer  "event_id"
    t.integer  "talk_time"
    t.integer  "talk_slots"
    t.text     "talk_submission_guidelines"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "accepting_submissions",      default: true
  end

  add_index "event_talks", ["event_id"], name: "index_event_talks_on_event_id"
  add_index "event_talks", ["talk_id"], name: "index_event_talks_on_talk_id"

  create_table "events", force: :cascade do |t|
    t.string   "title",        null: false
    t.text     "description"
    t.string   "logo_url"
    t.date     "date"
    t.text     "start_time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "organizer_id"
  end

  add_index "events", ["organizer_id"], name: "index_events_on_organizer_id"

  create_table "omniauth_identities", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "talks", force: :cascade do |t|
    t.string   "topic"
    t.string   "email"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "event_talk_id"
    t.string   "presenter_name"
  end

  add_index "talks", ["event_talk_id"], name: "index_talks_on_event_talk_id"

  create_table "user_details", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_details", ["user_id"], name: "index_user_details_on_user_id"

  create_table "user_profiles", force: :cascade do |t|
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_profiles", ["provider", "uid"], name: "index_user_profiles_on_provider_and_uid"
  add_index "user_profiles", ["user_id"], name: "index_user_profiles_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
