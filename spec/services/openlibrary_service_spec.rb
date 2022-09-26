require 'rails_helper'

RSpec.describe OpenlibraryService do
  it "makes a api call and returns books given a location and limit params" do
    VCR.use_cassette('books api call') do

      response = OpenlibraryService.find("denver,co", 5)
      # binding.pry
      expect(response).to be_a(Hash)
      expect(response[:numFound]).to be_a(Integer)
      expect(response[:docs]).to be_a(Array)
      expect(response[:docs].count).to eq(5)
      expect(response[:docs][0][:title]).to be_a(String)
      expect(response[:docs][0][:isbn]).to be_a(Array)
      expect(response[:docs][0][:publisher]).to be_a(Array)
      expect(response[:q]).to be_a(String)
    end
  end
end
