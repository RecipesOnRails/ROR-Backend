class Result
  attr_reader :title,
              :image,
              :cuisine,
              :calories,
              :id

  def initialize(data)
    @title = data[:attributes][:title]
    @image = data[:attributes][:image]
    @cuisine = data[:attributes][:cuisine]
    @calories = data[:attributes][:calories]
    @id = data[:attributes][:id]

  end

end
