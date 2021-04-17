# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    data = RecipesService.recipe_search(params[:ingredient1])
    render json: data
  end

  def show
    data = RecipesService.recipe_view(params[:id])
    recipe = render json: data
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
