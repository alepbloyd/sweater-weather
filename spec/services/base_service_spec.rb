require 'rails_helper'

RSpec.describe BaseService do

  describe "#open_weather_connection" do
    it 'returns a response' do
      service = BaseService.open_weather_connection

      expect(service).to be_an Object
    end
  end

  describe "#geocode_service" do
    it 'returns a response' do
      service = BaseService.geocode_service

      expect(service).to be_an Object
    end
  end

end