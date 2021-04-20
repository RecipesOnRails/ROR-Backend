class Result
  attr_reader :title,
              :image,
              :cuisine,
              :calories,
              :id

  def initialize(data)
    @title = data[:title]
    @image = data[:image]
    @cuisine = data[:cuisine]
    @calories = data[:calories]
    @id = data[:id]

  end

end
