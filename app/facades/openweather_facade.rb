class OpenweatherFacade

  def self.weather(location)
    json = OpenweatherService.one_call(location)
    current_weather = Current.new(json[:current])

    daily_weather = []
    json[:daily][0..4].map do |day|
      daily_weather << Daily.new(day)
    end

    hourly_weather = []
    json[:hourly][0..7].map do |hr|
      hourly_weather << Hourly.new(hr)
    end

    Weather.new([current_weather, daily_weather, hourly_weather])
  end
end
