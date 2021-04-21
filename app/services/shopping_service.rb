class ShoppingService
  def self.product_search(token, item_name)
    response = conn.get('v1/products') do |req|
      req.params[:token] = token
      req.params[:product] = item_name
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: 'https://vast-forest-40278.herokuapp.com/')
  end
end
