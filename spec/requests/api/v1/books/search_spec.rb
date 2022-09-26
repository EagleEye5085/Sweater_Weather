require 'rails_helper'

RSpec.describe "book search" do
  describe "happy path" do
    it "finds books for a particular city" do
      VCR.use_cassette('find books') do

        get "/api/v1/book-search?location=denver,co&quantity=5"

        expect(response).to be_successful

        result = JSON.parse(response.body, symbolize_names: true)[:data]
      # binding.pry
        # expect(result).to have_key(:id)
        # expect(result[:id]).to eq(nil)
        # expect(result[:type]).to eq("forecast")
        # expect(result[:attributes]).to have_key(:current_weather)
        # expect(result[:attributes][:current_weather]).to be_a(Hash)
        # expect(result[:attributes][:current_weather]).to have_key(:datetime)
        # expect(result[:attributes][:current_weather]).to have_key(:sunrise)
        # expect(result[:attributes][:current_weather]).to have_key(:sunset)
        # expect(result[:attributes][:current_weather]).to have_key(:temperature)
        # expect(result[:attributes][:current_weather]).to have_key(:feels_like)
        # expect(result[:attributes][:current_weather]).to have_key(:humidity)
        # expect(result[:attributes][:current_weather]).to have_key(:uvi)
        # expect(result[:attributes][:current_weather]).to have_key(:visibility)
        # expect(result[:attributes][:current_weather]).to have_key(:conditions)
        # expect(result[:attributes][:current_weather]).to have_key(:icon)
        # expect(result[:attributes]).to have_key(:daily_weather)
        # expect(result[:attributes][:daily_weather]).to be_a(Array)
        # expect(result[:attributes][:daily_weather][0]).to have_key(:datetime)
        # expect(result[:attributes][:daily_weather][0]).to have_key(:sunrise)
        # expect(result[:attributes][:daily_weather][0]).to have_key(:sunset)
        # expect(result[:attributes][:daily_weather][0]).to have_key(:max_temp)
        # expect(result[:attributes][:daily_weather][0]).to have_key(:min_temp)
        # expect(result[:attributes][:daily_weather][0]).to have_key(:conditions)
        # expect(result[:attributes][:daily_weather][0]).to have_key(:icon)
        # expect(result[:attributes]).to have_key(:hourly_weather)
        # expect(result[:attributes][:hourly_weather]).to be_a(Array)
        # expect(result[:attributes][:hourly_weather][0]).to have_key(:time)
        # expect(result[:attributes][:hourly_weather][0]).to have_key(:temperature)
        # expect(result[:attributes][:hourly_weather][0]).to have_key(:conditions)
        # expect(result[:attributes][:hourly_weather][0]).to have_key(:icon)
      end
    end
  end

  describe "sad path" do
    xit "does not send data that has not been requested by the hypothetical front end" do
      VCR.use_cassette('unwanted data') do

        get "/api/v1/forecast?location=denver,co"

        expect(response).to be_successful

        result = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(result[:attributes][:current_weather]).to_not have_key(:dew_point)
        expect(result[:attributes][:current_weather]).to_not have_key(:clouds)
        expect(result[:attributes][:current_weather]).to_not have_key(:wind_speed)
        expect(result[:attributes][:current_weather]).to_not have_key(:wind_deg)
        expect(result[:attributes][:daily_weather][0]).to_not have_key(:humidity)
        expect(result[:attributes][:daily_weather][0]).to_not have_key(:feels_like)
        expect(result[:attributes][:daily_weather][0]).to_not have_key(:pressure)
        expect(result[:attributes][:daily_weather][0]).to_not have_key(:wind_speed)
        expect(result[:attributes][:daily_weather][0]).to_not have_key(:wind_gust)
        expect(result[:attributes][:daily_weather][0]).to_not have_key(:uvi)
        expect(result[:attributes][:daily_weather][0]).to_not have_key(:clouds)
        expect(result[:attributes][:daily_weather][0]).to_not have_key(:dew_point)
        expect(result[:attributes][:hourly_weather][0]).to_not have_key(:dew_point)
        expect(result[:attributes][:hourly_weather][0]).to_not have_key(:feels_like)
        expect(result[:attributes][:hourly_weather][0]).to_not have_key(:pressure)
        expect(result[:attributes][:hourly_weather][0]).to_not have_key(:humidity)
        expect(result[:attributes][:hourly_weather][0]).to_not have_key(:visibility)
        expect(result[:attributes][:hourly_weather][0]).to_not have_key(:wind_speed)
      end
    end
  end
end
