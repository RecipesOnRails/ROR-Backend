class RecipesController < ApplicationController
  def index
    ingredients = params[:ingredient1]
    recipes = Faraday.get "https://pure-chamber-22336.herokuapp.com/recipes?ingredient1=#{ingredients}"
    # render json: File.read("spec/fixtures/recipe_call.json")
  end
end
