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

ActiveRecord::Schema.define(version: 20130708182257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "executions", force: true do |t|
    t.string   "age"
    t.string   "age_at_offense"
    t.string   "age_when_received"
    t.string   "codefendants"
    t.string   "computed_age_at_offense"
    t.string   "computed_age_executed"
    t.string   "computed_age_recieved"
    t.string   "computed_days_before_received_after_offense"
    t.string   "computed_days_between_received_and_executed"
    t.string   "county"
    t.string   "date_executed"
    t.string   "date_received"
    t.string   "dob"
    t.string   "edu_level"
    t.string   "eyes"
    t.string   "first_name"
    t.string   "gender"
    t.string   "height"
    t.string   "info_sheet"
    t.string   "last_name"
    t.string   "last_statement"
    t.string   "number"
    t.string   "offense_date"
    t.string   "prior_occupation"
    t.string   "prior_record"
    t.string   "race"
    t.string   "summary"
    t.string   "tdcj"
    t.string   "victim_info"
    t.string   "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
