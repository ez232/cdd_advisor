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

ActiveRecord::Schema.define(:version => 20121130041848) do

  create_table "buttons", :force => true do |t|
    t.integer  "proposal_id"
    t.string   "name"
    t.boolean  "pressing"
    t.boolean  "pushing"
    t.boolean  "pulling"
    t.boolean  "turning"
    t.boolean  "sliding"
    t.string   "shape"
    t.float    "length_or_external_diameter"
    t.float    "width"
    t.float    "height"
    t.float    "force_required"
    t.string   "colour"
    t.string   "background_colour"
    t.boolean  "one_finger_press"
    t.boolean  "two_fingers_press"
    t.boolean  "thumb_press"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "finishing_values", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "finishing_values_proposals", :id => false, :force => true do |t|
    t.integer "finishing_value_id"
    t.integer "proposal_id"
  end

  add_index "finishing_values_proposals", ["finishing_value_id"], :name => "index_finishing_values_proposals_on_finishing_value_id"
  add_index "finishing_values_proposals", ["proposal_id"], :name => "index_finishing_values_proposals_on_proposal_id"

  create_table "handles", :force => true do |t|
    t.integer  "proposal_id"
    t.string   "name"
    t.boolean  "holding"
    t.boolean  "moving"
    t.boolean  "carrying"
    t.string   "shape"
    t.float    "external_diameter"
    t.float    "width"
    t.float    "height"
    t.boolean  "pinch_grip"
    t.boolean  "power_grip"
    t.boolean  "spherical_grip"
    t.boolean  "cylindrical_grip"
    t.boolean  "disc_grip"
    t.boolean  "hook_grip"
    t.boolean  "pinch_grip_2"
    t.boolean  "disc_grip_2"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "knobs", :force => true do |t|
    t.integer  "proposal_id"
    t.string   "name"
    t.boolean  "pressing"
    t.boolean  "pushing"
    t.boolean  "pulling"
    t.boolean  "turning"
    t.boolean  "sliding"
    t.string   "shape"
    t.float    "length_or_external_diameter"
    t.float    "width"
    t.float    "height"
    t.float    "force_required"
    t.string   "colour"
    t.string   "background_colour"
    t.boolean  "pinch_grip"
    t.boolean  "span_grip"
    t.boolean  "spherical_grip"
    t.boolean  "cylindrical_grip"
    t.boolean  "disc_grip"
    t.boolean  "one_finger_press"
    t.boolean  "two_fingers_press"
    t.boolean  "thumb_press"
    t.boolean  "pinch_grip_2"
    t.boolean  "disc_grip_2"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "labels", :force => true do |t|
    t.integer  "proposal_id"
    t.string   "name"
    t.boolean  "printed"
    t.boolean  "digital"
    t.string   "font_type"
    t.float    "text_size"
    t.string   "text_colour"
    t.string   "background_colour"
    t.float    "reading_distance"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "maintenance_values", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "maintenance_values_proposals", :id => false, :force => true do |t|
    t.integer "maintenance_value_id"
    t.integer "proposal_id"
  end

  add_index "maintenance_values_proposals", ["maintenance_value_id"], :name => "index_maintenance_values_proposals_on_maintenance_value_id"
  add_index "maintenance_values_proposals", ["proposal_id"], :name => "index_maintenance_values_proposals_on_proposal_id"

  create_table "manufacturing_values", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "manufacturing_values_proposals", :id => false, :force => true do |t|
    t.integer "manufacturing_value_id"
    t.integer "proposal_id"
  end

  add_index "manufacturing_values_proposals", ["manufacturing_value_id"], :name => "index_manufacturing_values_proposals_on_manufacturing_value_id"
  add_index "manufacturing_values_proposals", ["proposal_id"], :name => "index_manufacturing_values_proposals_on_proposal_id"

  create_table "material_values", :force => true do |t|
    t.string   "category"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "material_values_proposals", :id => false, :force => true do |t|
    t.integer "material_value_id"
    t.integer "proposal_id"
  end

  add_index "material_values_proposals", ["material_value_id"], :name => "index_material_values_proposals_on_material_value_id"
  add_index "material_values_proposals", ["proposal_id"], :name => "index_material_values_proposals_on_proposal_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "target_market"
    t.string   "timescale"
    t.integer  "volume_of_sale"
    t.decimal  "final_price"
    t.boolean  "maximum_target"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "projects", ["name"], :name => "index_projects_on_name", :unique => true

  create_table "proposals", :force => true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.float    "product_weight"
    t.string   "image1"
    t.string   "image2"
    t.string   "key_components_mechanics"
    t.string   "key_components_electronics"
    t.string   "key_components_fixing"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "switches", :force => true do |t|
    t.integer  "proposal_id"
    t.string   "name"
    t.boolean  "pressing"
    t.boolean  "pushing"
    t.boolean  "pulling"
    t.boolean  "turning"
    t.boolean  "sliding"
    t.string   "shape"
    t.float    "length_or_external_diameter"
    t.float    "width"
    t.float    "height"
    t.float    "force_required"
    t.string   "colour"
    t.string   "background_colour"
    t.boolean  "pinch_grip"
    t.boolean  "span_grip"
    t.boolean  "spherical_grip"
    t.boolean  "disc_grip"
    t.boolean  "flat_hand_push"
    t.boolean  "one_finger_press"
    t.boolean  "two_fingers_press"
    t.boolean  "thumb_press"
    t.boolean  "pinch_grip_2"
    t.boolean  "disc_grip_2"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

end
