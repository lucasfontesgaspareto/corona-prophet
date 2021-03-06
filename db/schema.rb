# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_08_023452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "corona_data", force: :cascade do |t|
    t.date "reported_at"
    t.string "type"
    t.string "state"
    t.integer "confirmed"
    t.integer "deaths"
    t.boolean "prophetized", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "state_id"
    t.integer "confirmed_top"
    t.index ["state_id"], name: "index_corona_data_on_state_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.integer "population"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
