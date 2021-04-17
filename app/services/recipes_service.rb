class RecipesService
  def self.recipe_search(ingredient)
    response = Faraday.get "http://recipes?ingredient1=#{ingredient}"
    JSON.parse(response.body, symbolize_names: true)
  end
end
