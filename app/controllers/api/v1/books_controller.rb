class Api::V1::BooksController < ApplicationController

  def search
    book_results = LibraryFacade.book_search(params[:location])

    result_count = book_results.first

    books = book_results.last[0...params[:quantity].to_i]

    latlong = GeocodeFacade.get_lat_long(params[:location])

    forecast = WeatherFacade.get_weather_forecast(latlong.first,latlong.last)

    render json: BookSearchSerializer.new(params[:location],result_count,books,forecast).response
    # require 'pry'; binding.pry 

    # book_results = LibraryFacade.book_search
  end

end