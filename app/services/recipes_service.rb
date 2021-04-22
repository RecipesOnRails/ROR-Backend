# frozen_string_literal: true

class RecipesService
  def self.recipe_search(ingredient, diet = nil)
    response = connection.get "/api/v1/search/#{ingredient}" do |req|
      req.params["diet"] = diet
    end
    JSON.parse(response.body, symbolize_names: true) if response.status != 404
  end

  def self.recipe_view(id)
    response = connection.get("/api/v1/recipes/#{id}")
    JSON.parse(response.body, symbolize_names: true) if response.status != 500
  end

  private

  def self.connection
    Faraday.new(url: 'https://pure-chamber-22336.herokuapp.com')
  end
end
