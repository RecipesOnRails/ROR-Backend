class RecipesFacade
  def self.parse_recipe_details(id)
    data = RecipesService.recipe_view(id)
    poro = RecipePoro.new(data)
  end

end
