class Api::V1::BookController < ApplicationController

  def search
    render json: SearchSerializer.new(OpenlibraryFacade.search_by_location(params[:location], params[:quantity]))
  end

end
