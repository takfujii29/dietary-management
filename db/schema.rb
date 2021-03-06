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

ActiveRecord::Schema.define(version: 20200203080244) do

  create_table "foods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                       null: false
    t.integer  "calorie"
    t.float    "carbohydrate",    limit: 24
    t.float    "protein",         limit: 24
    t.float    "fat",             limit: 24
    t.float    "salt_equivalent", limit: 24
    t.float    "dietary_fiber",   limit: 24
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "management_foods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "management_id"
    t.integer  "food_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["food_id"], name: "index_management_foods_on_food_id", using: :btree
    t.index ["management_id"], name: "index_management_foods_on_management_id", using: :btree
  end

  create_table "managements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.string   "image"
    t.date     "day"
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_managements_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                           null: false
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "gender",                                         null: false
    t.integer  "age",                                            null: false
    t.float    "height",                 limit: 24,              null: false
    t.float    "weight",                 limit: 24,              null: false
    t.float    "bmi",                    limit: 24
    t.integer  "activity",                                       null: false
    t.integer  "intake_calorie"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["name"], name: "index_users_on_name", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "management_foods", "foods"
  add_foreign_key "management_foods", "managements"
  add_foreign_key "managements", "users"
end
