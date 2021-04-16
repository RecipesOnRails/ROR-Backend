require 'rails_helper'

RSpec.describe 'Recipe View Page Info' do
  describe 'happy paths' do
    it "returns a single recipe's info" do
      response = File.read("spec/fixtures/recipe_call.json")

      stub_request = stub_request(:get, "https://pure-chamber-22336.herokuapp.com/recipes/1").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v0.9.2'
           }).
         to_return(status: 200, body: response, headers: {})

      get '/recipes/1'

      parsed = JSON.parse(response, symbolize_names:true)

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
