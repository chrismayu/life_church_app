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

ActiveRecord::Schema.define(:version => 20131123155015) do

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
    t.boolean  "life_pulse"
    t.boolean  "leaders_blog"
    t.boolean  "store"
    t.boolean  "video"
    t.boolean  "articles"
  end

  create_table "articles", :force => true do |t|
    t.string   "name"
    t.string   "contact_person"
    t.string   "contact"
    t.string   "_email"
    t.text     "description"
    t.integer  "display_rank"
    t.text     "ta1"
    t.text     "ta2"
    t.text     "ta3"
    t.text     "ta4"
    t.text     "ta5"
    t.boolean  "advert_main_page"
    t.string   "title"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "bulletins", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "display_till"
    t.date     "display_start"
    t.boolean  "advert_main_page"
    t.string   "bulletin_image"
    t.string   "url"
    t.boolean  "members_only"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.boolean  "image_processed"
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
    t.string   "email_id"
  end

  create_table "event_pictures", :force => true do |t|
    t.string   "title"
    t.string   "event_image"
    t.string   "linked_event"
    t.text     "description"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "event_id"
    t.string   "eventimage"
    t.boolean  "image_processed"
  end

  create_table "events", :force => true do |t|
    t.string   "event_name"
    t.date     "event_date"
    t.string   "event_time"
    t.string   "contact_email"
    t.string   "location"
    t.string   "contact_person"
    t.text     "description"
    t.date     "remove_event_date"
    t.boolean  "display_main_page"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.time     "event_start_time"
  end

  create_table "ministries", :force => true do |t|
    t.string   "name"
    t.string   "contact_person"
    t.string   "contact_email"
    t.text     "description"
    t.integer  "display_rank"
    t.text     "ta1"
    t.text     "ta2"
    t.text     "ta3"
    t.text     "ta4"
    t.text     "ta5"
    t.boolean  "advert_main_page"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "ministry_children", :force => true do |t|
    t.string   "name"
    t.string   "contact_person"
    t.string   "contact_email"
    t.text     "description"
    t.integer  "display_rank"
    t.text     "ta1"
    t.text     "ta2"
    t.text     "ta3"
    t.text     "ta4"
    t.text     "ta5"
    t.boolean  "advert_main_page"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "ministry_id"
  end

  create_table "ministry_picture_children", :force => true do |t|
    t.string   "ministrychild_image"
    t.boolean  "image_processed"
    t.integer  "ministrychild_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "ministry_id"
  end

  create_table "ministry_pictures", :force => true do |t|
    t.string   "ministry_image"
    t.boolean  "image_processed"
    t.integer  "ministries_id"
    t.integer  "ministry_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
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

  create_table "sermon_pictures", :force => true do |t|
    t.string   "sermon_image"
    t.boolean  "image_processed"
    t.integer  "sermons_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "sermons", :force => true do |t|
    t.date     "date_of_sermon"
    t.string   "title"
    t.text     "description"
    t.string   "category"
    t.string   "audio_url"
    t.string   "video_url"
    t.date     "display_until"
    t.integer  "speaker_id"
    t.boolean  "members_only"
    t.string   "url"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "service_times", :force => true do |t|
    t.string   "day"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "service_name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "site_setups", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "speaker_pictures", :force => true do |t|
    t.string   "speaker_image"
    t.integer  "speaker_id"
    t.boolean  "image_processed"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "speakers", :force => true do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "from_church"
    t.text     "description"
    t.integer  "church_staff_id"
    t.string   "from_church_url"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "full_name"
  end

  create_table "staff_ranks", :force => true do |t|
    t.integer  "ranking"
    t.string   "category"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "approved",               :default => false, :null => false
  end

  add_index "users", ["approved"], :name => "index_users_on_approved"
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "videos", :force => true do |t|
    t.string   "name"
    t.string   "contact_person"
    t.string   "contact"
    t.string   "_email"
    t.text     "description"
    t.integer  "display_rank"
    t.text     "ta1"
    t.text     "ta2"
    t.text     "ta3"
    t.text     "ta4"
    t.text     "ta5"
    t.boolean  "advert_main_page"
    t.string   "title"
    t.string   "url"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
