# frozen_string_literal: true

FactoryBot.define do
  factory :meal_plan do
    title { 'MyString' }
    sequence(:user_id) {|n| n}
  end
end
