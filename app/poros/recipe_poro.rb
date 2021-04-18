class RecipePoro
  attr_reader :id,
              :name,
              :recipe_info,
              :instructions,
              :ingredients,
              :nutrients

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @recipe_info = data[:recipe_info]
    @instructions = data[:instructions]
    @ingredients = data[:ingredients]
    @nutrients = data[:nutrients]
  end
end
