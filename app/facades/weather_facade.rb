class WeatherFacade

  def self.get_weather_forecast(lat, long)
    json = WeatherService.get_weather_forecast(lat,long)

    current_weather = CurrentWeather.new(json[:current])

    five_day_forecast = []

    json[:daily][0..4].map do |day|
      five_day_forecast << DailyWeather.new(day)
    end

    eight_hour_forecast = []

    json[:hourly][0..7].map do |hour|
      eight_hour_forecast << HourlyWeather.new(hour)
    end

    [current_weather,five_day_forecast,eight_hour_forecast]
  end

end