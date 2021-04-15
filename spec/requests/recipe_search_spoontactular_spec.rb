require 'rails_helper'

RSpec.describe 'Recipe Endpoints' do
  describe 'happy paths' do
    it 'returns recipe information in correct format' do

      get '/recipes?ingredient1=chicken&ingredient2=rice'

      json_response = File.read("spec/fixtures/recipe_call.json")
      stub_request(:get, "https://pure-chamber-22336.herokuapp.com/recipes?ingredient1=chicken&ingredient2=rice").
        to_return(status: 200, body: json_response)

        parsed = JSON.parse(json_response, symbolize_names:true)

        expect(parsed).to be_a(Hash)
        expect(parsed[:data]).to be_a(Hash)

        expect(parsed[:data][:id]).to be_a(String)
        expect(parsed[:data][:type]).to be_a(String)
        expect(parsed[:data][:attributes]).to be_a(Hash)
        expect(parsed[:data][:attributes][:title]).to be_a(String)
        expect(parsed[:data][:attributes][:cuisine]).to be_a(String)
        expect(parsed[:data][:attributes][:calories]).to be_a(Integer)

    end
  end
end
