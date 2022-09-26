class Api::V1::ForecastController < ApplicationController

  def location_weather
    # binding.pry
    render json: LocationSerializer.new(OpenweatherFacade.weather(params[:location]))
  end

end
