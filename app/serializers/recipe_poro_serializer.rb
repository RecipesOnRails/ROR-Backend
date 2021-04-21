class RecipePoroSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id

  attributes :name, :image, :recipe_info, :ingredients, :instructions, :nutrients
end
