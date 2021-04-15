require 'rails_helper'

RSpec.describe 'Recipe Viewpage' do
  describe 'happy paths' do
    scenario 'returns recipe infomation' do
      json_response = File.read("spec/fixtures/recipe_call.json")
      test = stub_request(:get, "https://api.spoonacular.com/recipes/716429/information?apiKey=#{ENV['spoon_api']}&includeNutrition=true").
        # with(
        #   headers: {
        #     'apiKey'=> ENV['spoon_api']
        #   }
        # ).
        to_return(status: 200, body: json_response)

        require "pry"; binding.pry

    end
  end
end
