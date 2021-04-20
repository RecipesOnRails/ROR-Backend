require 'rails_helper'

RSpec.describe 'Recipe Poro', type: :request do
  describe 'happy path' do
    it 'makes a recipe object from given data' do

      VCR.use_cassette("recipe_view_page") do
        data = RecipesService.recipe_view(1)


        recipe = RecipePoro.new(data)


        expect(recipe.name).to eq(data[:name])
        expect(recipe.recipe_info).to eq(data[:recipe_info])
        recipe.instructions.each do |instruction|
          expect(instruction).to be_a(Instruction)
        end
        recipe.ingredients.each do |ingredient|
          expect(ingredient).to be_a(Ingredient)
        end
        recipe.nutrients.each do |nutrient|
          expect(nutrient).to be_a(Nutrient)
        end
      end
    end
  end
end
