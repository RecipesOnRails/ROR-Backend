class RecipesFacade
  def self.parse_recipe_details(id)
    data = RecipesService.recipe_view(id)
    poro = RecipePoro.new(data)
  end

  def self.parse_recipe_search(ingredient)
    data = RecipesService.recipe_search(ingredient)
    data.map do |result|
      Result.new(result)
    end
  end

end
