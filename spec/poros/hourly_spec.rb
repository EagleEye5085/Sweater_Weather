require 'rails_helper'

RSpec.describe Hourly do
  it "exists and has attributes" do
    data =
        {
          :dt=>1784680942,
          :temp =>71.78,
          :weather=>[{
            :description=>"rainy",
            :icon=>"01n"
          }]
        }
    hourly_weather = Hourly.new(data)

    expect(hourly_weather).to be_a(Hourly)
    expect(hourly_weather.temperature).to eq(71.78)
    expect(hourly_weather.time).to eq("2026-07-21 19:42:22.000000000 -0500")
    expect(hourly_weather.conditions).to eq("rainy")
    expect(hourly_weather.icon).to eq("01n")
  end
end
