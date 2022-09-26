class MapquestService

  def self.get_url
      Faraday.new("http://www.mapquestapi.com") do |faraday|
        faraday.params["key"] = ENV['map_key']
      end
    end


    def self.find(address)
      find = JSON.parse(get_url.get("/geocoding/v1/address?location=#{address}").body, symbolize_names: true)[:results][0][:locations][0][:latLng]
    end

  end
