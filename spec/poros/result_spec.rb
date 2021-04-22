require 'rails_helper'

RSpec.describe "Result poro" do
  it 'can create a search poro in facade' do
    VCR.use_cassette('results_poro') do
      ingredient = 'chicken'
      diet = 'gluten free'
      recipe = RecipesService.recipe_search(ingredient)
      info = recipe[:data].first

      search = Result.new(info)

      expect(search).to be_a(Result)
      expect(search.id).to eq(info[:attributes][:id])
      expect(search.title).to eq(info[:attributes][:title])
      expect(search.image).to eq(info[:attributes][:image])
      expect(search.cuisine).to eq(info[:attributes][:cuisine])
      expect(search.calories).to eq(info[:attributes][:calories])
    end
  end
end
