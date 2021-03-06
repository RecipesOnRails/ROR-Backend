# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/recipes', to: 'recipes#index'
      get '/recipes/:id', to: 'recipes#show'
      resources :meal_plans, only: [:create, :show, :update, :destroy] do
        resources :plan_recipes, only: [:create]
      end
    end
  end
end
