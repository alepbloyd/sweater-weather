class WeatherFacade

  def self.get_weather_forecast(lat, long)
    json = WeatherService.get_weather_forecast(lat,long)

    current_weather = CurrentWeather.new(json[:current])

    json[:daily][0..4].map do |day|
      DailyWeather.new(day)
    end

    # daily_weather = DailyWeather.new()
  end

end