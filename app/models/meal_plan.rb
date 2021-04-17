class MealPlan < ApplicationRecord
  has_many :meal_plan_recipes
  has_many :recipes, through: :meal_plan_recipes
end
