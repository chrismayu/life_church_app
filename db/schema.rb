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

ActiveRecord::Schema.define(:version => 20130921183227) do

  create_table "abouts", :force => true do |t|
    t.string   "service_day_1"
    t.string   "service_time_1"
    t.string   "service_day_2"
    t.string   "service_time_2"
    t.string   "service_day_3"
    t.string   "service_time_3"
    t.string   "address"
    t.string   "city"
    t.string   "postal_code"
    t.string   "phone_number"
    t.string   "toll_free_phone_number"
    t.string   "fax_number"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "youtube"
    t.string   "facebook"
    t.string   "video_stream"
    t.string   "twitter"
    t.string   "country"
    t.string   "province"
  end

  create_table "church_staff_pictures", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image"
    t.integer  "church_staff_id"
    t.boolean  "image_processed"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "staff_image"
  end

  create_table "church_staffs", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "spouse_first_name"
    t.string   "title"
    t.date     "started_service"
    t.text     "description"
    t.string   "contact_email"
    t.string   "image"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "birth_location"
    t.string   "category"
    t.integer  "rank"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "google_plus"
    t.string   "linked_in"
    t.string   "full_name"
    t.date     "birthday"
    t.string   "blog"
    t.string   "url"
    t.integer  "phone_ext"
    t.string   "phone_number"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "site_setups", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "staff_ranks", :force => true do |t|
    t.integer  "ranking"
    t.string   "category"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
