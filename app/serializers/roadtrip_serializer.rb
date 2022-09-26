class RoadtripSerializer

  def initialize(roadtrip_params)
    # require 'pry'; binding.pry 
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