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
<<<<<<< 2fd36a3767f00bf81bb2603411812cf9dcc2e3d0
ActiveRecord::Schema.define(version: 0) do
=======
ActiveRecord::Schema.define(version: 20150911185514) do
>>>>>>> Create models and migrations
=======
ActiveRecord::Schema.define(version: 20150911185514) do
>>>>>>> 8f15084c69f9573d83898d647d97f57258b46a61

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
<<<<<<< 2fd36a3767f00bf81bb2603411812cf9dcc2e3d0
=======
=======
>>>>>>> 8f15084c69f9573d83898d647d97f57258b46a61
  create_table "answers", force: :cascade do |t|
    t.string   "content"
    t.integer  "author_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "author_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "title",       null: false
    t.string   "content",     null: false
    t.integer  "author_id"
    t.integer  "best_answer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "votes", force: :cascade do |t|
    t.boolean  "up_or_down"
    t.integer  "votable_id"
    t.string   "votable_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "votes", ["votable_type", "votable_id"], name: "index_votes_on_votable_type_and_votable_id", using: :btree

<<<<<<< HEAD
>>>>>>> Create models and migrations
=======
>>>>>>> 8f15084c69f9573d83898d647d97f57258b46a61
end
