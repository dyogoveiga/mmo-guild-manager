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

ActiveRecord::Schema[7.2].define(version: 2024_12_24_162633) do
  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "gear_score"
    t.string "discord_username"
    t.string "role"
    t.string "main_weapon"
    t.string "off_hand"
    t.string "klass"
    t.date "member_since"
    t.string "invited_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "discord_username"], name: "index_characters_on_name_and_discord_username", unique: true
  end

  create_table "dynamic_event_participations", force: :cascade do |t|
    t.integer "character_id", null: false
    t.string "discord_image_url"
    t.string "status", default: "waiting_approval"
    t.string "event_name"
    t.string "mode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_dynamic_event_participations_on_character_id"
  end

  create_table "gear_score_histories", force: :cascade do |t|
    t.integer "value"
    t.date "reference_at"
    t.integer "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_gear_score_histories_on_character_id"
  end

  create_table "recurrent_events", force: :cascade do |t|
    t.string "name"
    t.integer "hour"
    t.string "week_day"
    t.string "type"
    t.integer "bonification_value"
    t.string "bonification_type"
    t.boolean "optional", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reputation_histories", force: :cascade do |t|
    t.integer "value"
    t.date "reference_at"
    t.integer "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_reputation_histories_on_character_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "discord_username"
    t.index ["discord_username"], name: "index_users_on_discord_username", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallet_transactions", force: :cascade do |t|
    t.integer "amount"
    t.integer "wallet_id", null: false
    t.string "type"
    t.integer "resource_origin_id"
    t.string "resource_origin_type"
    t.string "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wallet_id"], name: "index_wallet_transactions_on_wallet_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "balance"
    t.integer "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_wallets_on_character_id"
  end

  create_table "weekly_event_participations", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "weekly_event_id", null: false
    t.string "status", default: "waiting_approval"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_weekly_event_participations_on_character_id"
    t.index ["weekly_event_id"], name: "index_weekly_event_participations_on_weekly_event_id"
  end

  create_table "weekly_events", force: :cascade do |t|
    t.string "name"
    t.date "scheduled_at"
    t.integer "hour"
    t.string "week_day"
    t.string "type"
    t.integer "bonification_value"
    t.string "bonification_type"
    t.boolean "optional", default: true
    t.integer "weekly_schedule_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weekly_schedule_id"], name: "index_weekly_events_on_weekly_schedule_id"
  end

  create_table "weekly_schedules", force: :cascade do |t|
    t.date "start_at"
    t.date "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "dynamic_event_participations", "characters"
  add_foreign_key "gear_score_histories", "characters"
  add_foreign_key "reputation_histories", "characters"
  add_foreign_key "wallet_transactions", "wallets"
  add_foreign_key "wallets", "characters"
  add_foreign_key "weekly_event_participations", "characters"
  add_foreign_key "weekly_event_participations", "weekly_events"
  add_foreign_key "weekly_events", "weekly_schedules"
end
