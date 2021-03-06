# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :meal_plan_recipes
  has_many :meal_plans, through: :meal_plan_recipes
end
