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

ActiveRecord::Schema.define(version: 2019_07_10_064521) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "all_terrains", force: :cascade do |t|
    t.integer "game_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "img_src_array", default: [], array: true
  end

  create_table "cells", force: :cascade do |t|
    t.integer "game_session_id"
    t.string "name"
    t.boolean "on_map", null: false
    t.float "position_left"
    t.float "position_top"
    t.float "position_width"
    t.float "position_height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cell_type"
    t.string "inventory", default: [], array: true
  end

  create_table "game_sessions", force: :cascade do |t|
    t.boolean "in_progress", default: true, null: false
    t.boolean "complete", default: false, null: false
    t.string "expiration_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terrains", force: :cascade do |t|
    t.integer "game_session_id"
    t.integer "grid_x"
    t.integer "grid_y"
    t.string "img_src"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
