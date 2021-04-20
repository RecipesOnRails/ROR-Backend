require 'rails_helper'
RSpec.describe Ingredient do
  it 'makes ingredient object from data' do
    ingredient = {:name=>"Chicken", :amount=>"2 lbs."}

    result = Ingredient.new(ingredient)
    expect(result.class).to eq(Ingredient)
    expect(result.amount).to eq("2 lbs.")
    expect(result.name).to eq("Chicken")
  end
end
