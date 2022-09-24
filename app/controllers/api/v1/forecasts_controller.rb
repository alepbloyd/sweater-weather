class Api::V1::ForecastsController < ApplicationController

  def show
    latlong = GeocodeFacade.get_lat_long(params[:location])

    forecast = WeatherFacade.get_weather_forecast(latlong.first,latlong.last)

    forecast_json_response(forecast)
  end

end