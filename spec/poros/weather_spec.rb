RSpec.describe Weather do
  it "exists and has attributes" do
    data =
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

    data1 =
      {
        :dt=>1784680942,
        :sunrise=>1876543265,
        :sunset=>1837847465,
        :temp => {
          :min=>65.92,
          :max=>80.56,
        },
        :weather=>[{
          :description=>"windy",
          :icon=>"01n"
        }]
      }

    data2 =
        {
          :dt=>1784680942,
          :temp =>71.78,
          :weather=>[{
            :description=>"rainy",
            :icon=>"01n"
          }]
        }

    weather_total = [Current.new(data), Daily.new(data1), Hourly.new(data2)]
    weather = Weather.new(weather_total)

    expect(weather).to be_a(Weather)
    expect(weather.current_weather).to be_a(Current)
    expect(weather.daily_weather).to be_a(Daily)
    expect(weather.hourly_weather).to be_a(Hourly)

  end
end
