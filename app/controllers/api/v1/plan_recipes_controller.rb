class Api::V1::PlanRecipesController < ApplicationController
  def create
    mealplan = MealPlan.find(params[:meal_plan_id])

    result = mealplan.recipes.create(api_id: params[:api_id], title: params[:title])

    render json:  MealPlanSerializer.new(mealplan)
  end
end
