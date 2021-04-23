require 'rails_helper'

RSpec.describe MealPlanSerializer, type: :class do
  describe 'happy path' do
    it 'serializes the data in the correct format' do
      mealplan = create(:meal_plan, user_id: 34567, title: "this is a test")
      serialized = MealPlanSerializer.new(mealplan).serialized_json
      parsed = JSON.parse(serialized)


      expect(parsed["data"]["type"]).to eq("meal_plan")
      expect(parsed["data"]["attributes"]["title"]).to eq("this is a test")
      expect(parsed["data"]["attributes"]["user_id"]).to eq(34567)
      expect(parsed["data"]["attributes"]["start_date"].to_date).to eq(Date.today)
      expect(parsed["data"]["attributes"]["end_date"].to_date).to eq(Date.today + 7.days)
    end
  end
end
