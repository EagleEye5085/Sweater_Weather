class BookWeather

  attr_reader :id, :destination, :forcast, :total_books, :books

  def initialize(data)
    @id = nil
    @destination = data[3]
    @forcast = {"summary": "#{data[1].conditions}", "temperature": "#{data[1].temperature}"}
    @total_books = data[2]
    @books = data[0]
  end
end
