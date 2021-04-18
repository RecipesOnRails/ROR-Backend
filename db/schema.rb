# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_210_417_001_444) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'meal_plan_recipes', force: :cascade do |t|
    t.bigint 'recipe_id'
    t.bigint 'meal_plan_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['meal_plan_id'], name: 'index_meal_plan_recipes_on_meal_plan_id'
    t.index ['recipe_id'], name: 'index_meal_plan_recipes_on_recipe_id'
  end

  create_table 'meal_plans', force: :cascade do |t|
    t.string 'title'
    t.integer 'user_id'
    t.datetime 'start_date'
    t.datetime 'end_date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'recipes', force: :cascade do |t|
    t.integer 'api_id'
    t.string 'title'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'meal_plan_recipes', 'meal_plans'
  add_foreign_key 'meal_plan_recipes', 'recipes'
end
