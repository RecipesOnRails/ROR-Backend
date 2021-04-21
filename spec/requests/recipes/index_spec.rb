require 'rails_helper'

describe 'As a user' do
  describe 'when I send a request to "/api/v1/recipes"' do
    it 'it returns 20 items' do
      VCR.use_cassette('search_facade') do
        get '/api/v1/recipes', params: {  ingredient: 'chicken'  }
        parsed_response = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(response).to have_http_status(:success)

        expect(parsed_response).to be_an(Array)
        parsed_response.each do |result_item|
          expect(result_item[:type]).to eq("result")
          expect(result_item[:id]).to be_a(String)
          expect(result_item[:attributes]).to have_key(:calories)
          expect(result_item[:attributes][:calories]).to be_a(Numeric)
          expect(result_item[:attributes]).to have_key(:id)
          expect(result_item[:attributes][:id]).to be_an(Integer)
          expect(result_item[:attributes]).to have_key(:cuisine)
          expect(result_item[:attributes][:cuisine]).to be_a(String).or be(nil)
          expect(result_item[:attributes]).to have_key(:image)
          expect(result_item[:attributes][:image]).to be_a(String).or be(nil)
          expect(result_item[:attributes]).to have_key(:title)
          expect(result_item[:attributes][:title]).to be_a(String)
        end
        expect(parsed_response.count).to eq(20)
      end
    end
  end
end
