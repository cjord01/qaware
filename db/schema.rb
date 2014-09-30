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

ActiveRecord::Schema.define(version: 20140930013553) do

  create_table "beacons", force: true do |t|
    t.string   "location"
    t.string   "uuid"
    t.integer  "major"
    t.integer  "minor"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "beacons", ["employee_id"], name: "index_beacons_on_employee_id"

  create_table "completed_forms", force: true do |t|
    t.integer  "form_id"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "completed_forms", ["employee_id"], name: "index_completed_forms_on_employee_id"

  create_table "employees", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "manager_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employees", ["manager_id"], name: "index_employees_on_manager_id"

  create_table "forms", force: true do |t|
    t.string   "title"
    t.integer  "manager_id"
    t.integer  "beacon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "managers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "possible_responses", force: true do |t|
    t.string   "text"
    t.integer  "number_value"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "possible_responses", ["question_id"], name: "index_possible_responses_on_question_id"

  create_table "questions", force: true do |t|
    t.text     "text"
    t.integer  "form_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["form_id"], name: "index_questions_on_form_id"

  create_table "responses", force: true do |t|
    t.integer  "possible_response_id"
    t.integer  "completed_form_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "responses", ["completed_form_id"], name: "index_responses_on_completed_form_id"
  add_index "responses", ["possible_response_id"], name: "index_responses_on_possible_response_id"

end
