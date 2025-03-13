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

ActiveRecord::Schema[8.0].define(version: 2025_03_12_125650) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "grape_varieties", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "grape_type"
    t.string "pesticides", default: "unknown", null: false
    t.string "care", default: "unknown", null: false
    t.integer "age"
    t.float "sugar_level", default: 0.0, null: false
    t.string "flavor_profile"
    t.string "planting_density"
    t.string "stage", default: "unknown", null: false
    t.string "irrigation"
    t.uuid "vineyard_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vineyard_id"], name: "index_grape_varieties_on_vineyard_id"
  end

  create_table "vineyards", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "size"
    t.integer "age"
    t.string "soil_type", default: "unknown", null: false
    t.string "owner"
    t.string "season"
    t.string "irrigation"
    t.string "weather"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "grape_varieties", "vineyards"
end
