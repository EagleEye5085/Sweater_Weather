require 'rails_helper'

RSpec.describe Hourly do
  it "exists and has attributes" do
    data =
        {
          :dt=>1664080279,
          :temp =>60.06,
          :weather=>[{
            :description=>"clear sky",
            :icon=>"01n"
          }]
        }
    hourly_weather = Hourly.new(data)

    expect(hourly_weather).to be_a(Hourly)
    expect(hourly_weather.temperature).to eq(60.06)
    expect(hourly_weather.time).to eq("2022-09-24 21:31:19.000000000 -0700")
    expect(hourly_weather.conditions).to eq("clear sky")
    expect(hourly_weather.icon).to eq("01n")
  end
end
