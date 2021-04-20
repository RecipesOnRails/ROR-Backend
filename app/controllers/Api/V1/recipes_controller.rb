# frozen_string_literal: true

class Api::V1::RecipesController < ApplicationController
  def index
    data = RecipesService.recipe_search(params[:ingredient])
    paginated_data = Kaminari.paginate_array(data).page(params[:page]).per(20)
    render json: paginated_data
  end

  def show

    render json: RecipePoroSerializer.new(RecipesFacade.parse_recipe_details(params[:id]))
  end

  # def validate_params(params)
  #   ingredients = []
  #   ingredients << params[:ingredient1]
  #   ingredients << params[:ingredient2]
  #   ingredients << params[:ingredient3]
  #   ingredients = ingredients.compact
  #   ingredients.join(',')
  # end
end
