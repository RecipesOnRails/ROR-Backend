# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MealPlan, type: :model do
  describe 'relationships' do
    it { should have_many :meal_plan_recipes }
    it { should have_many(:recipes).through(:meal_plan_recipes) }
  end
end
