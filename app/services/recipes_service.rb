# frozen_string_literal: true

class RecipesService
  def self.recipe_search(ingredient)
    response = Faraday.get "http://recipes?ingredient1=#{ingredient}"
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.recipe_view(id)
    response = Faraday.get "http://recipes/#{id}"
    JSON.parse(response.body, symbolize_names: true)
  end
end
