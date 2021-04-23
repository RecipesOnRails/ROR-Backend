class Api::V1::MealPlansController < ApplicationController

  def create
    user_id = params[:user_id].to_i
    mealplan = MealPlan.where("user_id = ? and start_date >= ?", user_id, (Date.today - 7)).first_or_create
    mealplan.title = params[:title]
    mealplan.user_id = user_id
    mealplan.save
    render json: MealPlanSerializer.new(mealplan)
  end

end
