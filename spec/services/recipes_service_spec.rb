# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recipe Service Search', type: :request do
  describe 'happy path' do
    it 'returns recipe search data in correct format' do
      response = File.read('spec/fixtures/recipe_search_fixture.json')

      stub_request(:get, 'http://recipes?ingredient1=chicken')
        .with(
          headers: {
            'Accept' => '*/*',
            'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent' => 'Faraday v0.9.2'
          }
        )
        .to_return(status: 200, body: response, headers: {})

      ingredient = 'chicken'
      recipes = RecipesService.recipe_search(ingredient)

      expect(recipes).to be_a(Hash)
      expect(recipes[:data]).to be_a(Array)
      expect(recipes[:data][0]).to be_a(Hash)
      expect(recipes[:data][0]).to have_key(:id)
      expect(recipes[:data][0]).to have_key(:attributes)
      expect(recipes[:data][0][:attributes]).to be_a(Hash)
      expect(recipes[:data][0][:attributes]).to have_key(:id)
      expect(recipes[:data][0][:attributes]).to have_key(:title)
      expect(recipes[:data][0][:attributes]).to have_key(:image)
      expect(recipes[:data][0][:attributes]).to have_key(:calories)
      expect(recipes[:data][0][:attributes][:id]).to be_a(String)
      expect(recipes[:data][0][:attributes][:title]).to be_a(String)
      expect(recipes[:data][0][:attributes][:image]).to be_a(String)
      expect(recipes[:data][0][:attributes][:calories]).to be_a(Integer)
      expect(recipes[:data].length).to be < 20
    end
  end
end
