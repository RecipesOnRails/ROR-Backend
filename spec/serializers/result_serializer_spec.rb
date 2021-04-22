require 'rails_helper'

describe ResultSerializer, type: :class do
  it 'serializes Result objects' do
    VCR.use_cassette('recipe_search') do
      data = RecipesService.recipe_search("chicken")

      serialized = ResultSerializer.new(RecipesFacade.parse_recipe_search("chicken").first(20)).serialized_json
      test = JSON.parse(serialized, symbolize_names: true)[:data][0][:attributes]
      expect(test[:title]).to be_a(String)
      expect(test[:image]).to be_a(String)
      expect(test[:cuisine]).to be_a(String)
      expect(test[:calories]).to be_a(Float)
      expect(test[:id]).to be_a(Integer)
    end
  end
end
