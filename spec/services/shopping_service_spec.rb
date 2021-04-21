require 'rails_helper'

describe ShoppingService, type: :class do
  it 'product_search' do
    VCR.turn_off!
    item_name = "milk"
    token = "reallylongtoken"
    mock_response = {data: { upc: '003213510530' } }.to_json


    stub_request(:get, "https://vast-forest-40278.herokuapp.com/v1/products?product=milk&token=reallylongtoken").with(
      headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v0.9.2'
      })
      .to_return(status: 200, body: mock_response, headers: {})

    test = ShoppingService.product_search(token, item_name)

    expect(test[:data][:upc]).to be_a(String)
  end
end
