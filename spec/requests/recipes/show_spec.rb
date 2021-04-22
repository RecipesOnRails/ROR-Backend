require 'rails_helper'

describe "as a user" do
  describe 'happy path' do
    describe 'when I send a get request to "/api/v1/recipes/:id"' do
      it 'it returns a recipe and its data, including steps, ingredients and nutrition', :vcr do
        get '/api/v1/recipes/6'
        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(:success)
        expect(parsed_response).to be_a(Hash)
      end
    end
  end
  describe 'sad path' do
    describe 'if I send an id that does not exist'
    it 'returns an error', :vcr do
      get '/api/v1/recipes/8'
      expect(response).to have_http_status(500)
      expect(response.body).to eq("Invalid Record")
    end
  end
end
