require 'rails_helper'

RSpec.describe RecipePoroSerializer, type: :class do
  describe 'happy path' do
    it 'serializes the data in the correct format' do
      VCR.use_cassette('recipe_serialized') do
        id = 1
        parsed = RecipesService.recipe_view(id)
        poro = RecipePoro.new(parsed)
        serialized = RecipePoroSerializer.new(poro).serialized_json
        expected = File.read('spec/fixtures/recipe_1.json')

        expect(JSON.parse(serialized)).to eq(JSON.parse(expected))
      end
    end
  end
end
