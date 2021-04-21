class RecipePoro
  attr_reader :id,
              :name,
              :recipe_info,
              :instructions,
              :ingredients,
              :nutrients,
              :image

  def initialize(data)
    @id = data[:data][:attributes][:id]
    @name = data[:data][:attributes][:name]
    @image = data[:data][:attributes][:image]
    @recipe_info = data[:data][:attributes][:recipe_info]
    @instructions = new_recipe_instructions(data[:data][:attributes][:instructions])
    @ingredients = new_recipe_ingredients(data[:data][:attributes][:ingredients])
    @nutrients = new_recipe_nutrients(data[:data][:attributes][:nutrients])
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
