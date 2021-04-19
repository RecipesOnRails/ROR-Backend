# frozen_string_literal: true

class Api::V1::RecipesController < ApplicationController
  def index
    data = RecipesService.recipe_search(params[:ingredient1])
    render json: data
  end

  def show
    data = RecipesService.recipe_view(params[:id])
    poro = RecipePoro.new(data)
    render json: RecipePoroSerializer.new(poro)
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
