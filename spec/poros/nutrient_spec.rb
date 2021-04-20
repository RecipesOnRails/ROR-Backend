require 'rails_helper'
RSpec.describe Nutrient do
  it 'makes nutrient object from data' do
    nutrient = {:name=>"Calories", :amount=>"384.09 kcal"}

    result = Nutrient.new(nutrient)
    expect(result.class).to eq(Nutrient )
    expect(result.amount).to eq("384.09 kcal")
    expect(result.name).to eq("Calories")
  end
end
