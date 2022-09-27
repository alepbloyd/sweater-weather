class RoadtripFacade

  def self.road_trip(start_city,end_city)
    end_city_lat_long = GeocodeFacade.get_lat_long(end_city)

    end_city_weather_forecast = WeatherFacade.get_weather_forecast(end_city_lat_long.first,end_city_lat_long.last)

    travel_time = RouteFacade.get_route(start_city,end_city)

    travel_time_split = travel_time.split(":")

    travel_time_in_seconds = ((travel_time_split[0].to_i*3600) + (travel_time_split[1].to_i*60) + travel_time_split[2].to_i)

    arrival_time_hour = Time.at(DateTime.now.to_i + travel_time_in_seconds).strftime("%I:00 %p")

    if arrival_time_hour[0] == "0"
      arrival_time_hour = arrival_time_hour[1..-1]
    end

    hourly_forecasts = end_city_weather_forecast[2]

    forecast = hourly_forecasts.select { |hourly_forecast| hourly_forecast.time == arrival_time_hour }

    Roadtrip.new(start_city,end_city,travel_time,forecast.first)
  end

end