class OpenweatherService

  def self.get_url
      Faraday.new("https://api.openweathermap.org") do |faraday|
        faraday.params["appid"] = ENV['weather_key']
      end
    end

  def self.one_call(address)
    location = MapquestService.find(address)
    one_call = JSON.parse(get_url.get("/data/2.5/onecall?lat=#{location[:lat]}&lon=#{location[:lng]}&exclude=minutely, alerts").body, symbolize_names: true)
  end

end
