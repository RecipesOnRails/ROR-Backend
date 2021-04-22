require 'rails_helper'
RSpec.describe 'When I send a post request to api/v1/meal_plans' do
  xit 'creates a blank mealplan' do
    post '/api/v1/meal_plans', params: {'RAW_POST_DATA' => 'something'}
  end
end
