class Api::V1::ForecastsController < ApplicationController

  def show
    latlong = GeocodeFacade.get_lat_long(params[:location])

    lat = latlong.first
    long = latlong.last
  end

end