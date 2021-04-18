# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'relationships' do
    it { should have_many :meal_plan_recipes }
    it { should have_many(:meal_plans).through(:meal_plan_recipes) }
  end
end
