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

ActiveRecord::Schema.define(version: 20140810044859) do

  create_table "activities", force: true do |t|
    t.string   "name"
    t.text     "remark"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_items", force: true do |t|
    t.integer  "activity_id"
    t.integer  "volunteer_id"
    t.boolean  "is_finish"
    t.text     "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.text     "remark"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["name"], name: "index_groups_on_name", unique: true

  create_table "volunteer_group_map_histories", force: true do |t|
    t.integer  "group_id"
    t.integer  "volunteer_id"
    t.datetime "join_at"
    t.datetime "quit_at"
    t.boolean  "is_leader"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "volunteer_group_maps", force: true do |t|
    t.integer  "group_id"
    t.integer  "volunteer_id"
    t.datetime "join_at"
    t.boolean  "is_leader"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "volunteers", force: true do |t|
    t.string   "cell_phone"
    t.string   "name"
    t.boolean  "mail"
    t.datetime "birthday"
    t.string   "id_card_num"
    t.string   "address"
    t.datetime "belief_start_at"
    t.boolean  "is_baptized"
    t.datetime "baptized_day"
    t.datetime "join_at"
    t.datetime "quit_at"
    t.string   "skills"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "volunteers", ["cell_phone"], name: "index_volunteers_on_cell_phone", unique: true
  add_index "volunteers", ["id_card_num"], name: "index_volunteers_on_id_card_num", unique: true
  add_index "volunteers", ["name"], name: "index_volunteers_on_name"

end
