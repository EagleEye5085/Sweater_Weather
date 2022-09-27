require 'rails_helper'

RSpec.describe MapquestService do
  it "makes a api call and returns location lat/lng given a location" do
    VCR.use_cassette('map api call') do

      response = MapquestService.find("denver,co")
      # binding.pry
      expect(response).to be_a(Hash)
      expect(response).to have_key(:lat)
      expect(response[:lat]).to be_a(Float)
      expect(response).to have_key(:lng)
      expect(response[:lng]).to be_a(Float)
    end
  end
end
