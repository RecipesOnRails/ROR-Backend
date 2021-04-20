require 'rails_helper'
RSpec.describe Instruction do
  it 'makes instruction object from data' do
    instruction = {:step=>"Step 1", :instruction=>"Do some things"}

    result = Instruction.new(instruction)
    expect(result.class).to eq(Instruction )
    expect(result.instruction).to eq("Do some things")
    expect(result.step).to eq("Step 1")
  end
end
