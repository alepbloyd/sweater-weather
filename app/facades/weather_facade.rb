class WeatherFacade

  def self.get_weather_forecast(lat, long)
    json = WeatherService.get_weather_forecast(lat,long)

    current_weather = CurrentWeather.new(json[:current])
  end

end