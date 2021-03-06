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

ActiveRecord::Schema.define(version: 20161223194641) do

  create_table "badges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",       null: false
    t.string   "fa_symbol",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",       null: false
    t.string   "badge_name", null: false
    t.string   "video_name", null: false
    t.integer  "view_count", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_badges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "user_id",    null: false
    t.integer  "badge_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["badge_id"], name: "index_user_badges_on_badge_id", using: :btree
    t.index ["user_id"], name: "index_user_badges_on_user_id", using: :btree
  end

  create_table "user_videos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "video_id",               null: false
    t.integer  "user_id",                null: false
    t.integer  "iterations", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_user_videos_on_user_id", using: :btree
    t.index ["video_id"], name: "index_user_videos_on_video_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",       null: false
    t.integer  "company_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["company_id"], name: "fk_rails_7682a3bdfe", using: :btree
  end

  create_table "videos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "user_badges", "badges", on_delete: :cascade
  add_foreign_key "user_badges", "users", on_delete: :cascade
  add_foreign_key "user_videos", "users", on_delete: :cascade
  add_foreign_key "user_videos", "videos", on_delete: :cascade
  add_foreign_key "users", "companies", on_delete: :cascade
end
