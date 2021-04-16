require 'rails_helper'

RSpec.describe 'Recipe Frontend' do
  describe 'happy paths' do
    it 'returns recipe search query as csv' do

      response = File.read("spec/fixtures/recipe_call.json")

      sr = stub_request(:get, "https://pure-chamber-22336.herokuapp.com/recipes?ingredient1=chicken").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v0.9.2'
           }).
         to_return(status: 200, body: response, headers: {})

         get '/recipes?ingredient1=chicken&ingredient2=rice'

         expect()
    end
  end
end
