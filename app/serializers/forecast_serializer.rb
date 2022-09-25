class ForecastSerializer
  # include JSONAPI::Serializer

  # attributes :current_weather, :daily_weather, :hourly_weather

  def initialize(forecast_object)
    @current_weather = forecast_object.first.first
    @daily_weather = forecast_object.second
    @hourly_weather = forecast_object.third
  end

  def response
      {
        "data": {
          "id": nil,
          "type": "forecast",
          "attributes": {
            "current_weather": {
              "datetime": @current_weather.date_time,
              "sunrise": @current_weather.sunrise,
              "sunset": @current_weather.sunset,
              "temp": @current_weather.temp,
              "feels_like": @current_weather.feels_like,
              "humidity": @current_weather.humidity,
              "uvi": @current_weather.uvi,
              "visibility": @current_weather.visibility,
              "conditions": @current_weather.conditions,
              "icon": @current_weather.icon            
            },
            "daily_weather": [
              {
                "date": @daily_weather[0].date_time,
                "sunrise": @daily_weather[0].sunrise,
                "sunset": @daily_weather[0].sunset,
                "max_temp": @daily_weather[0].max_temp,
                "min_temp": @daily_weather[0].min_temp,
                "conditions": @daily_weather[0].conditions,
                "icon": @daily_weather[0].icon
              },
              {
                "date": @daily_weather[1].date_time,
                "sunrise": @daily_weather[1].sunrise,
                "sunset": @daily_weather[1].sunset,
                "max_temp": @daily_weather[1].max_temp,
                "min_temp": @daily_weather[1].min_temp,
                "conditions": @daily_weather[1].conditions,
                "icon": @daily_weather[1].icon
              },
              {
                "date": @daily_weather[2].date_time,
                "sunrise": @daily_weather[2].sunrise,
                "sunset": @daily_weather[2].sunset,
                "max_temp": @daily_weather[2].max_temp,
                "min_temp": @daily_weather[2].min_temp,
                "conditions": @daily_weather[2].conditions,
                "icon": @daily_weather[2].icon
              },
              {
                "date": @daily_weather[3].date_time,
                "sunrise": @daily_weather[3].sunrise,
                "sunset": @daily_weather[3].sunset,
                "max_temp": @daily_weather[3].max_temp,
                "min_temp": @daily_weather[3].min_temp,
                "conditions": @daily_weather[3].conditions,
                "icon": @daily_weather[3].icon
              },
              {
                "date": @daily_weather[4].date_time,
                "sunrise": @daily_weather[4].sunrise,
                "sunset": @daily_weather[4].sunset,
                "max_temp": @daily_weather[4].max_temp,
                "min_temp": @daily_weather[4].min_temp,
                "conditions": @daily_weather[4].conditions,
                "icon": @daily_weather[4].icon
              }
            ],
            "hourly_weather": [
              {
                "time": @hourly_weather[0].time,
                "conditions": @hourly_weather[0].conditions,
                "temp": @hourly_weather[0].temp,
                "icon": @hourly_weather[0].icon
              },
              {
                "time": @hourly_weather[1].time,
                "conditions": @hourly_weather[1].conditions,
                "temp": @hourly_weather[1].temp,
                "icon": @hourly_weather[1].icon
              },
              {
                "time": @hourly_weather[2].time,
                "conditions": @hourly_weather[2].conditions,
                "temp": @hourly_weather[2].temp,
                "icon": @hourly_weather[2].icon
              },
              {
                "time": @hourly_weather[3].time,
                "conditions": @hourly_weather[3].conditions,
                "temp": @hourly_weather[3].temp,
                "icon": @hourly_weather[3].icon
              },
              {
                "time": @hourly_weather[4].time,
                "conditions": @hourly_weather[4].conditions,
                "temp": @hourly_weather[4].temp,
                "icon": @hourly_weather[4].icon
              },
              {
                "time": @hourly_weather[5].time,
                "conditions": @hourly_weather[5].conditions,
                "temp": @hourly_weather[5].temp,
                "icon": @hourly_weather[5].icon
              },
              {
                "time": @hourly_weather[6].time,
                "conditions": @hourly_weather[6].conditions,
                "temp": @hourly_weather[6].temp,
                "icon": @hourly_weather[6].icon
              },
              {
                "time": @hourly_weather[7].time,
                "conditions": @hourly_weather[7].conditions,
                "temp": @hourly_weather[7].temp,
                "icon": @hourly_weather[7].icon
              },
            ]
          }
        }
      }
  end

end