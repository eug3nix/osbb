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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20211101205526) do
=======
ActiveRecord::Schema.define(version: 20200315194350) do
>>>>>>> 44249c58613d89cc6e40ce1e88be21115fa30b9d

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "cars", force: :cascade do |t|
    t.integer  "estate_id",  limit: 4
    t.string   "model",      limit: 255
    t.string   "reg_number", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "cars", ["estate_id"], name: "index_cars_on_estate_id", using: :btree

  create_table "contact_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "person_id",       limit: 4,                   null: false
    t.string   "value",           limit: 255,                 null: false
    t.boolean  "private",                     default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "contact_type_id", limit: 4
  end

  add_index "contacts", ["contact_type_id"], name: "index_contacts_on_contact_type_id", using: :btree
  add_index "contacts", ["person_id"], name: "index_contacts_on_person_id", using: :btree

  create_table "estate_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "estates", force: :cascade do |t|
<<<<<<< HEAD
    t.string   "name",                     null: false
    t.integer  "floor"
    t.integer  "rooms"
    t.float    "total_area"
    t.float    "living_area"
    t.integer  "regnum",         limit: 8
    t.integer  "estate_type_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "section"
=======
    t.string   "name",           limit: 255, null: false
    t.integer  "floor",          limit: 4
    t.integer  "rooms",          limit: 4
    t.float    "total_area",     limit: 24
    t.float    "living_area",    limit: 24
    t.integer  "regnum",         limit: 8
    t.integer  "estate_type_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "section",        limit: 4
>>>>>>> 44249c58613d89cc6e40ce1e88be21115fa30b9d
  end

  add_index "estates", ["estate_type_id"], name: "index_estates_on_estate_type_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.integer  "estate_id",    limit: 4
    t.date     "pay_date"
    t.decimal  "amount",                   precision: 10
    t.string   "payment_type", limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "payments", ["estate_id"], name: "index_payments_on_estate_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "firstname",    limit: 255, null: false
    t.string   "lastname",     limit: 255, null: false
    t.string   "middlename",   limit: 255
    t.integer  "inn",          limit: 4
    t.date     "birthdate"
    t.boolean  "notifiable"
    t.date     "move_in_date"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "person_estate_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "person_estates", force: :cascade do |t|
    t.integer  "person_id",               limit: 4
    t.integer  "estate_id",               limit: 4
    t.integer  "regno",                   limit: 4
    t.datetime "regdate"
<<<<<<< HEAD
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "person_estate_status_id"
    t.float    "part"
    t.string   "reg_reason",              limit: 300
=======
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "person_estate_status_id", limit: 4
    t.float    "part",                    limit: 24
>>>>>>> 44249c58613d89cc6e40ce1e88be21115fa30b9d
  end

  add_index "person_estates", ["estate_id"], name: "index_person_estates_on_estate_id", using: :btree
  add_index "person_estates", ["person_estate_status_id"], name: "index_person_estates_on_person_estate_status_id", using: :btree
  add_index "person_estates", ["person_id"], name: "index_person_estates_on_person_id", using: :btree

  create_table "person_notes", force: :cascade do |t|
    t.string   "text",       limit: 255
    t.integer  "person_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "person_notes", ["person_id"], name: "index_person_notes_on_person_id", using: :btree

  add_foreign_key "cars", "estates"
  add_foreign_key "contacts", "contact_types"
  add_foreign_key "payments", "estates"
end
