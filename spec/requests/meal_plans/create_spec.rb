require 'rails_helper'
RSpec.describe 'When I send a post request to api/v1/meal_plans' do
  it 'creates a blank mealplan' do
    create_list(:meal_plan, 10)
    post '/api/v1/meal_plans', params: {user_id: '12345', title: 'test title'}
    mealplan = MealPlan.last
    expect(mealplan.title).to eq("test title")
    expect(mealplan.user_id).to eq(12345)
    expect(mealplan.start_date).to eq(Date.today)
    expect(mealplan.end_date).to eq(Date.today + 7)
  end
end
