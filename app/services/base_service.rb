class BaseService

  def self.open_weather_connection
    Faraday.new(url: "https://api.openweathermap.org/data/3.0/onecall")
  end

  def self.geocode_service
    Faraday.new(url: "https://www.mapquestapi.com/geocoding/v1/address/")
  end

  def self.route_service
    Faraday.new(url: "http://www.mapquestapi.com/directions/v2/route")
  end

  def self.book_search
    Faraday.new(url: "http://openlibrary.org/search.json")
  end

end