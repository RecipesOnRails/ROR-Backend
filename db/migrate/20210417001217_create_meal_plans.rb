# frozen_string_literal: true

class CreateMealPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :meal_plans do |t|
      t.string :title
      t.integer :user_id
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
