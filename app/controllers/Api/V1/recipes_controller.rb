# frozen_string_literal: true

class Api::V1::RecipesController < ApplicationController
  def index
    data = RecipesFacade.parse_recipe_search(params[:ingredient])
    paginated_data = Kaminari.paginate_array(data).page(params[:page]).per(20)
    render json: ResultSerializer.new(paginated_data)
  end

  def show
    render json: RecipePoroSerializer.new(RecipesFacade.parse_recipe_details(params[:id]))
  end
end
