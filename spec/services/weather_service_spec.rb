require 'rails_helper'

RSpec.describe WeatherService do

  context "#get_weather_forecast" do
    xit 'returns the weather forecast given a search string' do
      response = WeatherService.get_weather_forecast("denver,co")

      expect(response).to be_a Hash
    end

  end

end