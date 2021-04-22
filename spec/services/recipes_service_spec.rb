# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recipe Service Search', type: :request do
  describe 'happy path' do
    it 'returns recipe search data in correct format' do
      VCR.use_cassette('service_test') do

        ingredient = 'chicken'
        recipes = RecipesService.recipe_search(ingredient)

        expect(recipes).to be_a(Array)
        recipes.each do |recipe|
          expect(recipe).to have_key(:title)
          expect(recipe[:title]).to be_a(String)
          expect(recipe).to have_key(:image)
          expect(recipe[:image]).to be_a(String)
          expect(recipe).to have_key(:cuisine)
          expect(recipe[:cuisine]).to be_a(String).or eq(nil)
          expect(recipe).to have_key(:id)
          expect(recipe[:id]).to be_a(Integer)
          expect(recipe).to have_key(:calories)
          expect(recipe[:id]).to be_a(Integer)
        end
      end
    end
    xit 'returns results filtered by diet' do
      ingredient = 'rice'
      diet = 'vegan'
      recipes = RecipesService.recipe_search(ingredient, diet)

      expect(recipes).to be_a(Array)

    end
  end
end
