require 'rails_helper'

RSpec.describe RouteService do

  context "#get_route" do
    it 'returns a response for searched locations with a possible route', :vcr do
      response = RouteService.get_route("Denver,CO", "Pueblo,CO")

      expect(response).to be_a(Hash)

      expect(response).to have_key(:route)
      expect(response[:route]).to be_a(Hash)

      expect(response[:route]).to have_key(:realTime)
      expect(response[:route][:formattedTime]).to be_a(String)
    end
  end

end
