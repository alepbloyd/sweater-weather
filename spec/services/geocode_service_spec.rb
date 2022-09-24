require 'rails_helper'

RSpec.describe GeocodeService do

  context "#get_lat_long" do

    it 'returns latitude and longitude for searched location' do
      response = GeocodeService.get_lat_long("washington,dc")

      expect(response).to be_a(Hash)

      expect(response).to have_key(:results)

      expect(response[:results]).to be_an(Array)

      expect(response[:results].last).to be_a(Hash)

      expect(response[:results].last).to have_key(:locations)

      expect(response[:results].last[:locations]).to be_an(Array)

      expect(response[:results].last[:locations].first).to be_a(Hash)

      expect(response[:results].last[:locations].first).to have_key(:latLng)

      expect(response[:results].last[:locations].first[:latLng]).to be_a(Hash)

      expect(response[:results].last[:locations].first[:latLng]).to have_key(:lat)

      expect(response[:results].last[:locations].first[:latLng][:lat]).to be_a(Float)

      expect(response[:results].last[:locations].first[:latLng]).to have_key(:lng)

      expect(response[:results].last[:locations].first[:latLng][:lat]).to be_a(Float)
    end

  end

end