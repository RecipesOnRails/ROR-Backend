class MealPlanSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :user_id, :start_date, :end_date, :recipes
end
