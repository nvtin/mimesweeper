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

ActiveRecord::Schema[7.0].define(version: 2023_01_05_173500) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.integer "width", null: false
    t.integer "height", null: false
    t.integer "num_mimes", null: false
    t.string "name", null: false
    t.string "creator_email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.virtual "searchable", type: :tsvector, as: "(setweight(to_tsvector('english'::regconfig, (COALESCE(name, ''::character varying))::text), 'A'::\"char\") || setweight(to_tsvector('english'::regconfig, (COALESCE(creator_email, ''::character varying))::text), 'B'::\"char\"))", stored: true
    t.index ["creator_email"], name: "index_boards_on_creator_email"
    t.index ["name"], name: "index_boards_on_name"
    t.index ["searchable"], name: "index_boards_on_searchable", using: :gin
  end

  create_table "cells", force: :cascade do |t|
    t.integer "board_id", null: false
    t.integer "row", null: false
    t.integer "column", null: false
    t.boolean "is_mime", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cells", "boards", on_delete: :cascade
end
