class Api::V1::RecipesController < ApplicationController
  def index
    data = RecipesFacade.parse_recipe_search(params[:ingredient], params[:diet])
    if data.nil?
      render json: "Invalid Search", status: 404
    else
      paginated_data = Kaminari.paginate_array(data).page(params[:page]).per(20)
      render json: ResultSerializer.new(paginated_data)
    end  
  end

  def show
    recipe = RecipesFacade.parse_recipe_details(params[:id])
    if recipe.nil?
      render json: "Invalid Record", status: 500
    else
      render json: RecipePoroSerializer.new(recipe)
    end
  end
end
