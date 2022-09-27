class RoadtripSerializer

  def initialize(roadtrip)
    @start_city = roadtrip.start_city
    @end_city = roadtrip.end_city
    @travel_time = roadtrip.travel_time
    @temperature = roadtrip.temperature
    @conditions = roadtrip.conditions
  end

  def response
    {
      "data": {
        "id": "roadtrip",
        "attributes": {
          "start_city": @start_city,
          "end_city": @end_city,
          "travel_time": @travel_time,
          "weather_at_eta": {
            "temperature": @temperature,
            "conditions": @conditions
          }
        }
      }
    }
  end

end