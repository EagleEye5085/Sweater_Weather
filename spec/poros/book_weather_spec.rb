require 'rails_helper'

RSpec.describe BookWeather do
  it "exists and has attributes" do
      data =
        {
          :isbn=>["0762507845", "9780762507849"],
          :title=>"Denver, Co",
          :publisher=>["Universal Map Enterprises"]
        }

        data1 =
            {
              :dt=>1738495068,
              :sunrise=>1827365466,
              :sunset=>1787676565,
              :temp=>70.23,
              :feels_like=>72.73,
              :humidity=>45,
              :dew_point=>33.15,
              :uvi=>5,
              :visibility=>183654,
              :weather=>[{
                :description=>"cloudy",
                :icon=>"01n"
              }]
            }

    book_weather = BookWeather.new([[Book.new(data)],Current.new(data1), 43234, "denver,co"])
    # binding.pry
    expect(book_weather).to be_a(BookWeather)
    expect(book_weather.books.count).to eq(1)
    expect(book_weather.destination).to eq("denver,co")
    expect(book_weather.total_books).to eq(43234)
    expect(book_weather.forcast).to eq({:summary=>"cloudy", :temperature=>"70.23"})
  end
end
