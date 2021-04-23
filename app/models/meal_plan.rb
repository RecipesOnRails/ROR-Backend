# frozen_string_literal: true

class MealPlan < ApplicationRecord
  has_many :meal_plan_recipes
  has_many :recipes, through: :meal_plan_recipes

  after_initialize if: :new_record? do
    self.start_date = Date.today
    self.end_date = (Date.today + 7.days)
  end
end
