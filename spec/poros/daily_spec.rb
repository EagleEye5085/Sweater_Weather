require 'rails_helper'

RSpec.describe Daily do
  it "exists and has attributes" do
      data =
        {
          :dt=>1664080279,
          :sunrise=>1664023766,
          :sunset=>1664067263,
          :temp => {
            :min=>59.86,
            :max=>60.96,
          },
          :weather=>[{
            :description=>"clear sky",
            :icon=>"01n"
          }]
        }

    daily_weather = Daily.new(data)
    expect(daily_weather).to be_a(Daily)
    expect(daily_weather.datetime).to eq("2022-09-24 21:31:19.000000000 -0700")
    expect(daily_weather.sunrise).to eq("2022-09-24 05:49:26.000000000 -0700")
    expect(daily_weather.sunset).to eq("2022-09-24 17:54:23.000000000 -0700")
    expect(daily_weather.max_temp).to eq(60.96)
    expect(daily_weather.min_temp).to eq(59.86)
    expect(daily_weather.conditions).to eq("clear sky")
    expect(daily_weather.icon).to eq("01n")
  end
end
