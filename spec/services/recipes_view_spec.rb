# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recipe Service View', type: :request do
  describe 'happy path' do
    it "returns a single recipe's data in correct format" do
      response = File.read('spec/fixtures/recipe_view.json')

      # stub_request(:get, 'http://recipes/1')
      #   .with(
      #     headers: {
      #       'Accept' => '*/*',
      #       'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      #       'User-Agent' => 'Faraday v0.9.2'
      #     }
      #   )
      #   .to_return(status: 200, body: response, headers: {})

      id = '1'

      VCR.use_cassette("recipe_view_page") do
        recipe = RecipesService.recipe_view(id)
        poro = RecipePoro.new(recipe)
        serialized = RecipePoroSerializer.new(poro)

        binding.pry

        expect(recipe).to be_a(Hash)
        expect(recipe).to have_key(:name)
        # expect(recipe[:name]).to eq("Tart Green Salad with Avocado Dressing")
        expect(recipe).to have_key(:image)
        expect(recipe[:image]).to be_a(String)
        expect(recipe).to have_key(:recipe_info)
        expect(recipe[:recipe_info]).to be_a(String)
        expect(recipe).to have_key(:instructions)
        expect(recipe[:instructions]).to be_a(Array)

        recipe[:instructions].each do |instruction|
          expect(instruction).to have_key(:step)
          expect(instruction[:step]).to be_a(Integer)
          expect(instruction).to have_key(:instruction)
          expect(instruction[:instruction]).to be_a(String)
        end

        expect(recipe).to have_key(:ingredients)
        expect(recipe[:ingredients]).to be_a(Array)

        recipe[:ingredients].each do |ingredient|
          expect(ingredient).to have_key(:name)
          expect(ingredient[:name]).to be_a(String)
          expect(ingredient).to have_key(:amount)
          expect(ingredient[:amount]).to be_a(String)
        end

        expect(recipe).to have_key(:nutrients)
        expect(recipe[:nutrients]).to be_a(Array)

        recipe[:nutrients].each do |nutrient|
          expect(nutrient).to have_key(:name)
          expect(nutrient[:name]).to be_a(String)
          expect(nutrient).to have_key(:amount)
          expect(nutrient[:amount]).to be_a(String)
        end
      end
    end
  end
end
