require 'rails_helper'

describe 'As a user' do
  describe 'when I send a request to "/api/v1/recipes"' do
    it 'it returns 20 items' do
      VCR.use_cassette('search_facade') do
        get "/api/v1/recipes", params: {  ingredient: "chicken"  }
        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(:success)

        expect(parsed_response).to be_an(Array)
        expect(parsed_response.count).to eq(20)
      end
    end
  end
end
