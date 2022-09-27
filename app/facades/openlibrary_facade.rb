class OpenlibraryFacade

  def self.search_by_location(location, quantity)
    json = OpenlibraryService.find(location, quantity)

    books = []
    json[:docs].map do |book|
      books << Book.new(book)
    end

    json1 = OpenweatherService.one_call(location)
    weather = Current.new(json1[:current])
    
    BookWeather.new([books, weather, json[:numFound], json[:q]])
  end
end
