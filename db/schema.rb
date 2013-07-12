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

ActiveRecord::Schema.define(:version => 20130711122852) do

  create_table "information", :force => true do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "inventories", :force => true do |t|
    t.string   "item_description"
    t.string   "lot_number"
    t.integer  "reaction_kit",     :limit => 255
    t.integer  "reactions_used",   :limit => 255
    t.date     "best_till",        :limit => 255
    t.date     "opened",           :limit => 255
    t.string   "comment"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "empty"
    t.string   "category"
    t.integer  "user_id"
  end

  create_table "libraries", :force => true do |t|
    t.integer  "sample_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "user_id"
    t.date     "lib_date"
    t.float    "ul_used"
    t.integer  "target_size"
    t.float    "quantity"
    t.integer  "mid"
    t.integer  "shearing_min"
    t.boolean  "end_repair_done"
    t.string   "number_of_bands_in_eGel"
    t.integer  "cycles_of_amplification"
    t.date     "date_bioanalyser"
    t.string   "pmol_before"
    t.string   "pmol_after"
    t.string   "comment"
    t.string   "lib_number"
    t.integer  "inventory_id"
    t.string   "shearing_kit"
    t.string   "fragment_kit"
    t.string   "e_gel"
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "sender_id"
    t.string   "title"
    t.string   "context"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mianes", :force => true do |t|
    t.string   "aims"
    t.string   "expected_result"
    t.string   "why_ngs"
    t.string   "possible_alternative"
    t.string   "approach"
    t.string   "positive_control"
    t.string   "negative_control"
    t.string   "replicates"
    t.string   "reference_dataset"
    t.string   "possible_pittfalls"
    t.string   "needs_qc"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "project_id"
  end

  create_table "pools", :force => true do |t|
    t.integer  "template_id"
    t.date     "date_pooling"
    t.float    "pmol_l"
    t.float    "tdf"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "user_id"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "state"
  end

  create_table "samples", :force => true do |t|
    t.string   "name"
    t.integer  "size"
    t.float    "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "project_id"
  end

  create_table "seq_runs", :force => true do |t|
    t.string   "name"
    t.string   "kit"
    t.string   "chip"
    t.date     "seq_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sharedmessages", :force => true do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "archive"
  end

  create_table "templates", :force => true do |t|
    t.string   "ot_kit_used"
    t.float    "pmol_l"
    t.string   "tdf"
    t.date     "pooling"
    t.float    "pmol_l_pool"
    t.string   "tdf_pool"
    t.string   "qbit_before_es"
    t.string   "qbit_after_es"
    t.string   "commit"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "responsible_id"
    t.boolean  "failed"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.string   "name"
    t.string   "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
