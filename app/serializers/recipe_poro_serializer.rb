class RecipePoroSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id

  attributes :name, :recipe_info, :ingredients, :instructions, :nutrients
end
