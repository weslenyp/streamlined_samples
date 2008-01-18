# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 10) do

  create_table "coaches", :force => true do |t|
    t.integer "team_id"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "middle_name"
  end

  create_table "home_states", :force => true do |t|
    t.string "name"
  end

  create_table "leagues", :force => true do |t|
    t.string "name"
  end

  create_table "players", :force => true do |t|
    t.integer "team_id"
    t.string  "name"
  end

  create_table "sponsors", :force => true do |t|
    t.string  "name"
    t.string  "spokesperson_type"
    t.integer "spokesperson_id"
  end

  create_table "teams", :force => true do |t|
    t.string  "name"
    t.string  "city"
    t.string  "sport"
    t.integer "home_state_id"
    t.decimal "annual_sales",  :precision => 8, :scale => 2
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

end
