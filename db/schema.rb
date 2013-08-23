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

ActiveRecord::Schema.define(:version => 20130823084022) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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
    t.integer  "reaction_kit"
    t.integer  "reactions_used"
    t.date     "best_till"
    t.date     "opened"
    t.string   "comment"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.boolean  "empty"
    t.integer  "user_id"
    t.integer  "category_id"
    t.float    "price"
  end

  create_table "inventories_libraries", :id => false, :force => true do |t|
    t.integer "library_id"
    t.integer "inventory_id"
  end

  add_index "inventories_libraries", ["library_id", "inventory_id"], :name => "index_libraries_inventories_on_library_id_and_inventory_id"

  create_table "inventories_pgmruns", :id => false, :force => true do |t|
    t.integer "inventory_id"
    t.integer "pgmrun_id"
  end

  add_index "inventories_pgmruns", ["inventory_id", "pgmrun_id"], :name => "index_inventories_pgmruns_on_inventory_id_and_pgmrun_id"

  create_table "inventories_templates", :id => false, :force => true do |t|
    t.integer "inventory_id"
    t.integer "template_id"
  end

  add_index "inventories_templates", ["inventory_id", "template_id"], :name => "index_inventories_templates_on_inventory_id_and_template_id"

  create_table "lib5uls", :force => true do |t|
    t.integer  "pool_id"
    t.integer  "library_id"
    t.float    "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
    t.integer  "shearing_kit"
    t.integer  "fragment_kit"
    t.boolean  "failed"
    t.string   "comment_why"
    t.integer  "mid_kit"
    t.integer  "pool_id"
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
    t.string   "construct"
  end

  create_table "myfiles", :force => true do |t|
    t.string   "name"
    t.string   "path"
    t.integer  "project_id"
    t.string   "category"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "tagfield"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "myfiles_tags", :id => false, :force => true do |t|
    t.integer "myfile_id"
    t.integer "tag_id"
  end

  add_index "myfiles_tags", ["myfile_id", "tag_id"], :name => "index_myfiles_tags_on_myfile_id_and_tag_id"

  create_table "pgmruns", :force => true do |t|
    t.integer  "template_id"
    t.date     "run_date"
    t.date     "ot_date"
    t.string   "initialisation"
    t.string   "run_number"
    t.string   "pgm_number"
    t.integer  "mean_read_length"
    t.integer  "perc_loading"
    t.integer  "keysignal"
    t.integer  "final_lib_reads"
    t.integer  "perc_low_quality"
    t.string   "testfragment"
    t.string   "ts_version"
    t.string   "comment"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "pools", :force => true do |t|
    t.integer  "template_id"
    t.date     "date_pooling"
    t.float    "pmol_l"
    t.float    "tdf"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "user_id"
    t.float    "lib_5ul_low_te_buffer"
    t.integer  "ul_dilution"
    t.float    "bioanalyser_qbit"
    t.float    "tdf_used"
    t.string   "name"
    t.boolean  "ready"
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

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "templates", :force => true do |t|
    t.string   "qbit_before_es"
    t.string   "qbit_after_es"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.boolean  "failed"
    t.string   "comment"
    t.date     "date_bioanalyser"
    t.integer  "pool_id"
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
