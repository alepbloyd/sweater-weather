class WeatherService

  def self.get_weather_forecast(search_string)
    response = BaseService.open_weather_connection.get("")
  end

end