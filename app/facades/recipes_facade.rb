class RecipesFacade
  def self.parse_recipe_details(id)
    data = RecipesService.recipe_view(id)
    RecipePoro.new(data) if data != nil
  end

  def self.parse_recipe_search(ingredient, diet = nil)
    data = RecipesService.recipe_search(ingredient, diet)
    data.map do |result|
      Result.new(result)
    end
  end
end
