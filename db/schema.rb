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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131218003611) do

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "micropost_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["user_id", "micropost_id", "created_at"], :name => "index_comments_on_user_id_and_micropost_id_and_created_at"

  create_table "likes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "micropost_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["user_id", "micropost_id"], :name => "index_likes_on_user_id_and_micropost_id", :unique => true

  create_table "microposts", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "wall_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id", "wall_id", "created_at"], :name => "index_microposts_on_user_id_and_wall_id_and_created_at"

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "hometown"
    t.string   "education"
    t.string   "work"
    t.text     "interests"
    t.string   "quote"
    t.integer  "birth_day"
    t.integer  "birth_month"
    t.integer  "birth_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id", :unique => true

  create_table "relationships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "confirmed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["user_id", "friend_id"], :name => "index_relationships_on_user_id_and_friend_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "walls", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "walls", ["user_id"], :name => "index_walls_on_user_id", :unique => true

end
