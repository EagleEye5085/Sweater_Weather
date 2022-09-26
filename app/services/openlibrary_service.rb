class OpenlibraryService

  def self.get_url
      Faraday.new("http://openlibrary.org") do |faraday|
        faraday.params["key"] = ENV['map_key']
      end
    end


    def self.find(address)
      find = JSON.parse(get_url.get("/search.json?q=#{address}").body, symbolize_names: true)
    end

  end
