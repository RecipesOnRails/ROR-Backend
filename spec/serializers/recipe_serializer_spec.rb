require 'rails_helper'

RSpec.describe 'Recipe Serializer', type: :request do
  describe 'happy path' do
    xit 'serializes the data in the correct formart' do

      # response = File.read('spec/fixtures/recipe_view.json')
      #
      # stub_request(:get, 'http://recipes/1')
      #   .with(
      #     headers: {
      #       'Accept' => '*/*',
      #       'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #       'User-Agent' => 'Faraday v0.9.2'
      #     }
      #   )
      #   .to_return(status: 200, body: response, headers: {})

        id = 1
        parsed = RecipesService.recipe_view(id)
        poro = RecipePoro.new(parsed)
        serialized = RecipeSerializer.new(poro)
    end
  end
end
