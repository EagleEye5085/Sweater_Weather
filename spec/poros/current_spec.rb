require 'rails_helper'

RSpec.describe Current do
  it "exists and has attributes" do

    data =
        {
          :dt=>1738495068,
          :sunrise=>1827365466,
          :sunset=>1787676565,
          :temp=>70.23,
          :feels_like=>72.73,
          :humidity=>45,
          :dew_point=>33.15,
          :uvi=>5,
          :visibility=>183654,
          :weather=>[{
            :description=>"cloudy",
            :icon=>"01n"
          }]
        }

    weather = Current.new(data)

  expect(weather).to be_a(Current)
  expect(weather.datetime).to eq("2025-02-02 05:17:48.000000000 -0600")
  expect(weather.sunrise).to eq("2027-11-27 19:31:06.000000000 -0600")
  expect(weather.sunset).to eq("2026-08-25 11:49:25.000000000 -0500") #refactor these later for more readability
  expect(weather.temperature).to eq(70.23)
  expect(weather.feels_like).to eq(72.73)
  expect(weather.humidity).to eq(45)
  expect(weather.uvi).to eq(5)
  expect(weather.visibility).to eq(183654)
  expect(weather.conditions).to eq("cloudy")
  expect(weather.icon).to eq("01n")
  end
end
