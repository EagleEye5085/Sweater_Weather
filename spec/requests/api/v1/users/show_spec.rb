require 'rails_helper'

RSpec.describe "forcast location" do
  describe 'user API' do
    it 'creates a new user' do

      user_params = {
        "email": "whatever@example.com",
        "password": "password123",
        "password_confirmation": "password123"
      }

      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

      result = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response).to be_successful
      binding.pry
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
