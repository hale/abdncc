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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120511091413) do

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "ccode"
    t.integer  "credits"
    t.string   "coordinator"
    t.string   "prereq"
    t.text     "note"
    t.text     "description"
    t.text     "assessment"
    t.integer  "level"
    t.string   "department"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "subject_id"
    t.integer  "user_id"
  end

  create_table "courses_users", :id => false, :force => true do |t|
    t.integer "course_id"
    t.integer "user_id"
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "course_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "course_id"
    t.integer  "bookmark_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "status"
  end

  add_index "users", ["bookmark_id"], :name => "index_users_on_bookmark_id"
  add_index "users", ["course_id"], :name => "index_users_on_course_id"

end
