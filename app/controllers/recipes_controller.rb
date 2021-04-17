class RecipesController < ApplicationController
  def index
    data = RecipesService.recipe_search(params[:ingredient1])
    render json: data
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
