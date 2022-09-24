class WeatherService

  def self.get_weather_forecast(lat,lng)
    response = BaseService.open_weather_connection.get("?lat=#{lat}&lon=#{lng}&appid=#{ENV['openweather_api']}&units=imperial")
    JSON.parse(response.body, symbolize_names: true)
  end

end