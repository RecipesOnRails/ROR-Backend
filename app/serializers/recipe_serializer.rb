class RecipeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title
end
