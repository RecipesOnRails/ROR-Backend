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
    @instructions = new_recipe_instructions(data[:instructions])
    @ingredients = new_recipe_ingredients(data[:ingredients])
    @nutrients = new_recipe_nutrients(data[:nutrients])
  end

  def new_recipe_instructions(data)
    data.map do |instruction|
      Instruction.new(instruction)
    end
  end

  def new_recipe_ingredients(data)
    data.map do |ingredient|
      Ingredient.new(ingredient)
    end
  end
  def new_recipe_nutrients(data)
    data.map do |nutrient|
      Nutrient.new(nutrient)
    end
  end
end
