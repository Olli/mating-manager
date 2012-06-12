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

ActiveRecord::Schema.define(:version => 20120605110247) do

  create_table "countries", :force => true do |t|
    t.string "code"
    t.string "name"
  end

  add_index "countries", ["code"], :name => "index_countries_on_code"
  add_index "countries", ["name"], :name => "index_countries_on_name"

  create_table "deliveries", :force => true do |t|
    t.integer  "user_id"
    t.integer  "mating_apiary_id"
    t.integer  "mating_unit_id"
    t.integer  "amount"
    t.date     "incomedate"
    t.date     "pickupdate"
    t.string   "state",            :default => "requested"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "father_lines", :force => true do |t|
    t.string   "name"
    t.string   "race"
    t.text     "description"
    t.integer  "mating_apiary_id"
    t.date     "startdate"
    t.date     "enddate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
  end

  add_index "father_lines", ["mating_apiary_id"], :name => "index_father_lines_on_mating_apiary_id"
  add_index "father_lines", ["state"], :name => "index_father_lines_on_state"

  create_table "mating_apiaries", :force => true do |t|
    t.string   "name"
    t.decimal  "lat",        :precision => 10, :scale => 0
    t.decimal  "lon",        :precision => 10, :scale => 0
    t.text     "address"
    t.boolean  "enabled",                                   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "mating_apiaries", ["user_id"], :name => "index_mating_apiaries_on_user_id"

  create_table "mating_units", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "places", :force => true do |t|
    t.integer  "mating_apiary_id"
    t.integer  "mating_unit_id"
    t.integer  "amount",           :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "used_places", :force => true do |t|
    t.integer  "mating_apiary_id"
    t.integer  "mating_unit_id"
    t.integer  "delivery_id"
    t.string   "identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.string   "house_number"
    t.string   "zip"
    t.string   "city"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
