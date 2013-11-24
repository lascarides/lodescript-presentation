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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131124004207) do

  create_table "equivalents", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "organization_id"
    t.string   "namespace"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", force: true do |t|
    t.integer  "organization_id"
    t.integer  "thing_id"
    t.integer  "position"
    t.string   "source_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["organization_id"], name: "index_memberships_on_organization_id"
  add_index "memberships", ["thing_id"], name: "index_memberships_on_thing_id"

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pieces", force: true do |t|
    t.integer  "organization_id"
    t.string   "predicate"
    t.integer  "thing_id"
    t.string   "content"
    t.integer  "equivalent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
    t.integer  "position"
  end

  create_table "schemes", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "things", force: true do |t|
    t.string   "name"
    t.text     "lode"
    t.integer  "scheme_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
