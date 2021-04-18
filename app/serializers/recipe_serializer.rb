class RecipeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :recipe_info, :ingredients, :instructions, :nutrients
end
