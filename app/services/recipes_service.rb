# frozen_string_literal: true

class RecipesService
  def self.recipe_search(ingredient)
    response = connection.get "/api/v1/search/#{ingredient}"
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.recipe_view(id)
    response = connection.get("/api/v1/recipes/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.connection
    Faraday.new(url: 'https://pure-chamber-22336.herokuapp.com')
  end
end
