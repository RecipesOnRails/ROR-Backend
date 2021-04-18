# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MealPlanRecipe, type: :model do
  describe 'relationships' do
    it { should belong_to :meal_plan }
    it { should belong_to :recipe }
  end
end
