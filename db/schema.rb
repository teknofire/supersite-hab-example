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

ActiveRecord::Schema.define(version: 2020_05_18_204035) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "queue_classic_jobs", force: :cascade do |t|
    t.text "q_name", null: false
    t.text "method", null: false
    t.jsonb "args", null: false
    t.datetime "locked_at"
    t.integer "locked_by"
    t.datetime "created_at", default: -> { "now()" }
    t.datetime "scheduled_at", default: -> { "now()" }
    t.index ["q_name", "id"], name: "idx_qc_on_name_only_unlocked", where: "(locked_at IS NULL)"
    t.index ["scheduled_at", "id"], name: "idx_qc_on_scheduled_at_only_unlocked", where: "(locked_at IS NULL)"
  end

end
