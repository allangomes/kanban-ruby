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

ActiveRecord::Schema.define(version: 2018_06_21_062911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "board", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "position"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "position"
    t.string "color"
    t.bigint "board_id"
    t.bigint "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_card_on_board_id"
    t.index ["list_id"], name: "index_card_on_list_id"
  end

  create_table "list", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "position"
    t.string "color"
    t.bigint "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_list_on_board_id"
  end

  add_foreign_key "card", "board"
  add_foreign_key "card", "list"
  add_foreign_key "list", "board"
end
