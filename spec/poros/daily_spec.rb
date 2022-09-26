require 'rails_helper'

RSpec.describe Daily do
  it "exists and has attributes" do
      data =
        {
          :dt=>1784680942,
          :sunrise=>1876543265,
          :sunset=>1837847465,
          :temp => {
            :min=>65.92,
            :max=>80.56,
          },
          :weather=>[{
            :description=>"windy",
            :icon=>"01n"
          }]
        }

    daily_weather = Daily.new(data)
    expect(daily_weather).to be_a(Daily)
    expect(daily_weather.datetime).to eq("2026-07-21 19:42:22.000000000 -0500")
    expect(daily_weather.sunrise).to eq("2029-06-19 01:01:05.000000000 -0500")
    expect(daily_weather.sunset).to eq("2028-03-28 04:11:05.000000000 -0500")
    expect(daily_weather.max_temp).to eq(80.56)
    expect(daily_weather.min_temp).to eq(65.92)
    expect(daily_weather.conditions).to eq("windy")
    expect(daily_weather.icon).to eq("01n")
  end
end
