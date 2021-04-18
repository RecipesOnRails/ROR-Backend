class RecipePoro
  attr_reader :name,
              :recipe_info,
              :instructions,
              :ingredients,
              :nutrients

  def initialize(data)
    @name = data[:name]
    @recipe_info = data[:recipe_info]
    @instructions = data[:instructions]
    @ingredients = data[:ingredients]
    @nutrients = data[:nutrients]
  end
end
