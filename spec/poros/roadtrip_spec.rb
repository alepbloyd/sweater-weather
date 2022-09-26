require 'rails_helper'

RSpec.describe Roadtrip do

  it 'exists' do
  
    data = {
      "id": nil,
      "type": "roadtrip",
      "attributes": {
        "start_city": "Denver, CO",
        "end_city": "Estes Park, CO",
        "travel_time": "2 hours, 13 minutes",
        "weather_at_eta": {
          "temperature": 59.4,
          "conditions": "partly cloudy with a chance of meatballs"
        }
      }
    }

    road_trip = Roadtrip.new(data)

    expect(road_trip).to be_a(Roadtrip)

    # expect(road_trip.)

  end

end