# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Recipe Service Search', type: :request do
  describe 'happy path' do
    it 'returns recipe search data in correct format' do
      VCR.use_cassette('service_test') do

        ingredient = 'chicken'
        recipes = RecipesService.recipe_search(ingredient)

        expect(recipes[:data]).to be_a(Array)
        recipes[:data].each do |recipe|
          expect(recipe).to have_key(:type)
          expect(recipe[:type]).to eq("search")
          expect(recipe[:attributes]).to have_key(:title)
          expect(recipe[:attributes][:title]).to be_a(String)
          expect(recipe[:attributes]).to have_key(:image)
          expect(recipe[:attributes][:image]).to be_a(String)
          expect(recipe[:attributes]).to have_key(:cuisine)
          expect(recipe[:attributes][:cuisine]).to be_a(String).or eq(nil)
          expect(recipe[:attributes]).to have_key(:id)
          expect(recipe[:attributes][:id]).to be_a(Integer)
          expect(recipe[:attributes]).to have_key(:calories)
          expect(recipe[:attributes][:id]).to be_a(Integer)
        end
      end
    end
    it 'returns results filtered by diet' do
      VCR.use_cassette('diet_filter') do
        ingredient = 'rice'
        diet = 'vegan'
        recipes = RecipesService.recipe_search(ingredient, diet)

        expect(recipes[:data]).to be_a(Array)
        recipes[:data].each do |recipe|
          expect(recipe).to have_key(:type)
          expect(recipe[:type]).to eq("search")
          expect(recipe[:attributes]).to have_key(:title)
          expect(recipe[:attributes][:title]).to be_a(String)
          expect(recipe[:attributes]).to have_key(:image)
          expect(recipe[:attributes][:image]).to be_a(String)
          expect(recipe[:attributes]).to have_key(:cuisine)
          expect(recipe[:attributes][:cuisine]).to be_a(String).or eq(nil)
          expect(recipe[:attributes]).to have_key(:id)
          expect(recipe[:attributes][:id]).to be_a(Integer)
          expect(recipe[:attributes]).to have_key(:calories)
          expect(recipe[:attributes][:id]).to be_a(Integer)
        end  
      end
    end
  end
end
