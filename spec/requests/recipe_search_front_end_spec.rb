require 'rails_helper'

RSpec.describe 'Recipe Search' do
  describe 'happy paths' do
    it 'returns recipe search data' do
      get '/recipes?ingredient1=chicken&ingredient2=rice'

    end
  end
end
