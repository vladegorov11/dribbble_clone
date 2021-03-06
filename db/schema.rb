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

ActiveRecord::Schema.define(version: 20180702135448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.bigint "designer_id"
    t.bigint "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["designer_id"], name: "index_abilities_on_designer_id"
    t.index ["skill_id"], name: "index_abilities_on_skill_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "number"
    t.integer "month"
    t.integer "year"
    t.integer "cvv"
    t.integer "designer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["designer_id"], name: "index_cards_on_designer_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shot_id"
    t.integer "user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "designers", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "instagram_link"
    t.string "facebook_link"
    t.string "twitter_link"
    t.string "city"
    t.string "phone"
    t.integer "shots_count", default: 0
  end

  create_table "follows", force: :cascade do |t|
    t.integer "designer_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hues", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "impressions", force: :cascade do |t|
    t.string "impressionable_type"
    t.integer "impressionable_id"
    t.integer "user_id"
    t.string "controller_name"
    t.string "action_name"
    t.string "view_name"
    t.string "request_hash"
    t.string "ip_address"
    t.string "session_hash"
    t.text "message"
    t.text "referrer"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index"
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "actor_id"
    t.string "notify_type", null: false
    t.string "target_type"
    t.integer "target_id"
    t.string "second_target_type"
    t.integer "second_target_id"
    t.string "third_target_type"
    t.integer "third_target_id"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "notify_type"], name: "index_notifications_on_user_id_and_notify_type"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "report_types", force: :cascade do |t|
    t.string "name"
    t.integer "report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_report_types_on_report_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "body"
    t.integer "report_type_id"
    t.integer "user_id"
    t.integer "reportable_id"
    t.string "reportable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_type_id"], name: "index_reports_on_report_type_id"
    t.index ["reportable_id"], name: "index_reports_on_reportable_id"
    t.index ["reportable_type"], name: "index_reports_on_reportable_type"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "shot_hues", force: :cascade do |t|
    t.bigint "shot_id"
    t.bigint "hue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hue_id"], name: "index_shot_hues_on_hue_id"
    t.index ["shot_id"], name: "index_shot_hues_on_shot_id"
  end

  create_table "shots", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "designer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_shot"
    t.integer "impressions_count", default: 0
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "comments_count", default: 0
    t.string "status", default: "draft"
    t.index ["cached_votes_down"], name: "index_shots_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_shots_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_shots_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_shots_on_cached_votes_up"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "shot_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shot_id"], name: "index_taggings_on_shot_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.string "votable_type"
    t.bigint "votable_id"
    t.string "voter_type"
    t.bigint "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["votable_type", "votable_id"], name: "index_votes_on_votable_type_and_votable_id"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
    t.index ["voter_type", "voter_id"], name: "index_votes_on_voter_type_and_voter_id"
  end

  add_foreign_key "abilities", "designers"
  add_foreign_key "abilities", "skills"
  add_foreign_key "shot_hues", "hues"
  add_foreign_key "shot_hues", "shots"
  add_foreign_key "taggings", "shots"
  add_foreign_key "taggings", "tags"
end
