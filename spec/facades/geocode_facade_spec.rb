require 'rails_helper'

RSpec.describe GeocodeFacade do

  it 'returns latitude and longitude of a search term', :vcr do
    coordinates = GeocodeFacade.get_lat_long("washington,dc")

    expect(coordinates.first).to eq(38.892062)
    expect(coordinates.last).to eq(-77.019912)
  end

end