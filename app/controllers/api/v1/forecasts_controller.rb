class Api::V1::ForecastsController < ApplicationController

  def show
    latlong = GeocodeFacade.get_lat_long(params[:location])

    forecast = WeatherFacade.get_weather_forecast(latlong.first,latlong.last)

    render json: ForecastSerializer.new(forecast).response
  end

end