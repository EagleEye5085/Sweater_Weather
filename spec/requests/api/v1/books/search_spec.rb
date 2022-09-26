require 'rails_helper'

RSpec.describe "book search" do
  describe "happy path" do
    it "finds books for a particular city" do
      VCR.use_cassette('find books') do

        get "/api/v1/book-search?location=denver,co&quantity=5"

        expect(response).to be_successful

        result = JSON.parse(response.body, symbolize_names: true)[:data]
      # binding.pry
        expect(result).to have_key(:id)
        expect(result[:id]).to eq(nil)
        expect(result[:type]).to eq("books")
        expect(result[:attributes]).to have_key(:destination)
        expect(result[:attributes][:destination]).to eq("denver,co")
        expect(result[:attributes]).to have_key(:forcast)
        expect(result[:attributes][:forcast]).to be_a(Hash)
        expect(result[:attributes][:forcast]).to have_key(:summary)
        expect(result[:attributes][:forcast][:summary]).to eq("clear sky")
        expect(result[:attributes][:forcast]).to have_key(:temperature)
        expect(result[:attributes][:forcast][:temperature]).to eq("294.26")
        expect(result[:attributes]).to have_key(:total_books)
        expect(result[:attributes][:total_books]).to eq(47113)
        expect(result[:attributes]).to have_key(:books)
        expect(result[:attributes][:books].count).to eq(5)
        expect(result[:attributes][:books][0]).to have_key(:isbn)
        expect(result[:attributes][:books][0][:isbn]).to eq(["0762507845", "9780762507849"])
        expect(result[:attributes][:books][0]).to have_key(:title)
        expect(result[:attributes][:books][0][:title]).to eq("Denver, Co")
        expect(result[:attributes][:books][0]).to have_key(:publisher)
        expect(result[:attributes][:books][0][:publisher]).to eq(["Universal Map Enterprises"])
      end
    end
  end
end
