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

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20111016130601) do
=======
ActiveRecord::Schema.define(:version => 20111011121301) do
>>>>>>> availability

  create_table "absences", :force => true do |t|
    t.integer  "user_id"
    t.date     "day"
    t.string   "start_time"
    t.string   "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "absences", ["user_id"], :name => "index_absences_on_user_id"

  create_table "appointments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "customer_id"
    t.date     "due"
    t.string   "period"
    t.text     "description"
    t.text     "notes"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "archived",    :default => false
  end

  add_index "appointments", ["customer_id"], :name => "index_appointments_on_customer_id"
  add_index "appointments", ["user_id"], :name => "index_appointments_on_user_id"

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "holidays", :force => true do |t|
    t.integer  "user_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "holidays", ["user_id"], :name => "index_holidays_on_user_id"

  create_table "tasks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "customer_id"
    t.text     "description"
    t.date     "due"
    t.string   "priority"
    t.string   "status"
    t.string   "period"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["customer_id"], :name => "index_tasks_on_customer_id"
  add_index "tasks", ["user_id"], :name => "index_tasks_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "show_in_calendar"
    t.boolean  "admin"
    t.integer  "position"
  end

end
