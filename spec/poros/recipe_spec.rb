require 'rails_helper'

RSpec.describe 'Recipe Poro', type: :request do
  describe 'happy path' do
    it 'makes a recipe object from given data' do
      response = File.read('spec/fixtures/recipe_view.json')

      stub_request(:get, 'http://recipes/1')
        .with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent' => 'Faraday v0.9.2'
          }
        )
        .to_return(status: 200, body: response, headers: {})

      id = 1
      data = RecipesService.recipe_view(id)

      recipe = RecipePoro.new(data)

      expect(recipe.name).to eq(data[:name])
      expect(recipe.recipe_info).to eq(data[:recipe_info])
      expect(recipe.instructions).to eq(data[:instructions])
      expect(recipe.ingredients).to eq(data[:ingredients])
      expect(recipe.nutrients).to eq(data[:nutrients])
    end
  end
end
