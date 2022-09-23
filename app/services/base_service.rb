class BaseService

  def self.open_weather_connection
    Faraday.new(url: "https://api.openweathermap.org/")
  end

end