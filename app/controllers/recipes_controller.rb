class RecipesController < ApplicationController
  def index
    validate_params(params)
    ingredients = params[:ingredient1]
    recipes = Faraday.get "https://pure-chamber-22336.herokuapp.com/recipes?ingredient1=#{ingredients}"
    # render json: File.read("spec/fixtures/recipe_call.json")
  end

  def show
    recipe = render json: "https://pure-chamber-22336.herokuapp.com/recipes/1"
  end

  def validate_params(params)
    ingredients = []
    ingredients << params[:ingredient1]
    ingredients << params[:ingredient2]
    ingredients << params[:ingredient3]
    ingredients = ingredients.compact
    ingredients.join(',')
  end
end
