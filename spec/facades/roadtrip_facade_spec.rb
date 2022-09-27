require 'rails_helper'

RSpec.describe RoadtripFacade do

  it 'returns a roadtrip object with required attributes' do
    roadtrip = RoadtripFacade.road_trip("Washington,DC","Richmond,VA")

    expect(roadtrip).to be_a(Roadtrip)

    expect(roadtrip.start_city).to eq("Washington,DC")
    expect(roadtrip.end_city).to eq("Richmond,VA")

    expect(roadtrip.travel_time).to be_a(String)
    expect(roadtrip.temperature.to_f).to be_a(Float)
    
    expect(roadtrip.conditions).to be_a(String)
  end

end