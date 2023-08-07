# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_06_232803) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bachelorettes", force: :cascade do |t|
    t.string "name"
    t.integer "season_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "contestant_outings", force: :cascade do |t|
    t.bigint "contestant_id", null: false
    t.bigint "outing_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contestant_id"], name: "index_contestant_outings_on_contestant_id"
    t.index ["outing_id"], name: "index_contestant_outings_on_outing_id"
  end

  create_table "contestants", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "hometown"
    t.bigint "bachelorette_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bachelorette_id"], name: "index_contestants_on_bachelorette_id"
  end

  create_table "outings", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "contestant_outings", "contestants"
  add_foreign_key "contestant_outings", "outings"
  add_foreign_key "contestants", "bachelorettes"
end
