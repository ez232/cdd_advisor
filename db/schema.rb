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

ActiveRecord::Schema.define(:version => 20120816004928) do

  create_table "handles", :force => true do |t|
    t.integer  "proposal_id"
    t.boolean  "holding"
    t.boolean  "moving"
    t.boolean  "carrying"
    t.string   "shape"
    t.float    "length_or_radius"
    t.float    "width"
    t.float    "height"
    t.boolean  "pinch_grip"
    t.boolean  "power_grip"
    t.boolean  "span_grip"
    t.boolean  "spherical_grip"
    t.boolean  "cylindrical_grip"
    t.boolean  "disc_grip"
    t.boolean  "hook_grip"
    t.boolean  "flat_hand_push"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "target_market"
    t.string   "timescale"
    t.integer  "volume_of_sale"
    t.decimal  "final_price"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "projects", ["name"], :name => "index_projects_on_name", :unique => true

  create_table "proposals", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
