require 'rails_helper'
RSpec.describe 'When I send a post request to api/v1/meal_plans/:id/plan_recipes' do
  it 'creates a recipe and adds it to a mealplan' do
    mealplan = create(:meal_plan, user_id: 34567, title: "this is a test")
    post "/api/v1/meal_plans/#{mealplan.id}/plan_recipes", params: {api_id: '123', title: 'test title'}

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:id]).to eq(mealplan.id.to_s)
    expect(parsed[:data][:attributes][:recipes]).to be_an(Array)
    expect(parsed[:data][:attributes][:recipes].first).to have_key(:api_id)
    expect(parsed[:data][:attributes][:recipes].first[:api_id]).to eq(123)
    expect(parsed[:data][:attributes][:recipes].first[:title]).to eq('test title')
  end
end
