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

ActiveRecord::Schema[7.2].define(version: 2026_04_09_232112) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "spellbook_enteries", force: :cascade do |t|
    t.bigint "spellbook_id", null: false
    t.bigint "spell_id", null: false
    t.boolean "prepared"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spell_id"], name: "index_spellbook_enteries_on_spell_id"
    t.index ["spellbook_id"], name: "index_spellbook_enteries_on_spellbook_id"
  end

  create_table "spellbooks", force: :cascade do |t|
    t.string "name"
    t.string "character_class"
    t.integer "character_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spells", force: :cascade do |t|
    t.string "name", null: false
    t.integer "level", default: 0, null: false
    t.string "school", null: false
    t.string "casting_time"
    t.string "range"
    t.string "duration"
    t.text "description"
    t.boolean "ritual", default: false
    t.boolean "concentration", default: false
    t.string "classes", default: [], array: true
    t.string "components", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classes"], name: "index_spells_on_classes", using: :gin
    t.index ["level"], name: "index_spells_on_level"
    t.index ["name"], name: "index_spells_on_name", unique: true
    t.index ["school"], name: "index_spells_on_school"
    t.check_constraint "level >= 0 AND level <= 9", name: "spell_level_range"
  end

  add_foreign_key "spellbook_enteries", "spellbooks"
  add_foreign_key "spellbook_enteries", "spells"
end
