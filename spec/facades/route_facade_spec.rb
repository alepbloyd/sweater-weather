require 'rails_helper'

RSpec.describe RouteFacade do

  it 'returns a travel time for a searched route', :vcr do
    travel_time = RouteFacade.get_route("Denver,CO","Pueblo,CO")

    expect(travel_time).to be_a(String)
  end
end