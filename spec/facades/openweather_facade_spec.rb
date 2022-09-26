require 'rails_helper'

   RSpec.describe OpenweatherFacade do
     it 'returns an array of 5 day weather forecast' do
       VCR.use_cassette('5 day weather forcast') do
         weather = OpenweatherFacade.weather("denver,co")

         expect(weather).to be_a(Weather)
         expect(weather.current_weather).to be_a(Current)
         expect(weather.daily_weather[0]).to be_a(Daily)
         expect(weather.hourly_weather[0]).to be_a(Hourly)
         expect(weather.daily_weather.count).to eq(5)
         expect(weather.hourly_weather.count).to eq(8)
       end
     end
   end
