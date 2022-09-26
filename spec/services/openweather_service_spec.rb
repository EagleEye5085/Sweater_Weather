require 'rails_helper'

RSpec.describe OpenweatherService do
  it "makes a api call and returns current weather given a lat and long params" do

    response = OpenweatherService.one_call("denver,co")
    # binding.pry
    expect(response).to be_a(Hash)
    expect(response[:current]).to be_a(Hash)
    expect(response[:current][:dt]).to be_a(Integer)
    expect(response[:current][:sunrise]).to be_a(Integer)
    expect(response[:current][:sunset]).to be_a(Integer)
    expect(response[:current][:temp]).to be_a(Float)
    expect(response[:current][:feels_like]).to be_a(Float)
    expect(response[:current][:humidity]).to be_a(Integer)
    expect(response[:current][:uvi]).to be_a(Float)
    expect(response[:current][:weather]).to be_a(Array)
    expect(response[:current][:weather][0][:description]).to be_a(String)
    expect(response[:current][:weather][0][:icon]).to be_a(String)
  end

  it "makes an api call and returns a 5 day forecast given a lat and long params" do
    response = OpenweatherService.one_call("denver,co")

    expect(response).to have_key(:daily)
    expect(response[:daily]).to be_a(Array)
    expect(response[:daily][0][:sunrise]).to be_a(Integer)
    expect(response[:daily][0][:temp]).to be_a(Hash)
    expect(response[:daily][0][:temp][:max]).to be_a(Float)
    expect(response[:daily][0][:temp][:min]).to be_a(Float)
  end

  it "makes an api call and returns 8 hour forecast given a lat and long params" do
    response = OpenweatherService.one_call("denver,co")

    expect(response).to have_key(:hourly)
    expect(response[:hourly]).to be_a(Array)
    expect(response[:hourly][0][:dt]).to be_a(Integer)
    expect(response[:hourly][0][:temp]).to be_a(Float)
    expect(response[:hourly][0][:weather][0][:description]).to be_a(String)
    expect(response[:hourly][0][:weather][0][:icon]).to be_a(String)
  end
end
