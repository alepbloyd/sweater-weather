require 'rails_helper'

RSpec.describe WeatherService do

  context "#get_weather_forecast" do
    it 'returns the current weather forecast given a latitude and longitude', :vcr do
      response = WeatherService.get_weather_forecast(38.892,-77.019)

      expect(response).to be_a Hash

      expect(response).to have_key(:current)
      expect(response[:current]).to be_a(Hash)

      expect(response[:current]).to have_key(:dt)
      expect(response[:current][:dt]).to be_an(Integer)

      expect(response[:current]).to have_key(:sunrise)
      expect(response[:current][:sunrise]).to be_an(Integer)

      expect(response[:current]).to have_key(:sunset)
      expect(response[:current][:sunset]).to be_an(Integer)

      expect(response[:current]).to have_key(:temp)
      expect(response[:current][:temp]).to be_a(Float)

      expect(response[:current]).to have_key(:feels_like)
      expect(response[:current][:feels_like]).to be_a(Float)

      expect(response[:current]).to have_key(:humidity)
      expect(response[:current][:humidity]).to be_an(Integer)

      expect(response[:current]).to have_key(:uvi)
      expect(response[:current][:uvi].to_f).to be_a(Float)

      expect(response[:current]).to have_key(:visibility)
      expect(response[:current][:visibility]).to be_an(Integer)

      expect(response[:current]).to have_key(:weather)
      expect(response[:current][:weather]).to be_an(Array)
      expect(response[:current][:weather].first).to be_a(Hash)

      expect(response[:current][:weather].first).to have_key(:description)
      expect(response[:current][:weather].first[:description]).to be_a(String)

      expect(response[:current][:weather].first).to have_key(:icon)
      expect(response[:current][:weather].first[:icon]).to be_a(String)
    end

    it 'returns the daily weather forecast given a latitude and longitude', :vcr do
      response = WeatherService.get_weather_forecast(38.892,-77.019)

      expect(response).to have_key(:daily)
      expect(response[:daily]).to be_an(Array)

      expect(response[:daily].first).to have_key(:dt)
      expect(response[:daily].first[:dt]).to be_an(Integer)

      expect(response[:daily].first).to have_key(:sunrise)
      expect(response[:daily].first[:sunrise]).to be_an(Integer)

      expect(response[:daily].first).to have_key(:sunset)
      expect(response[:daily].first[:sunset]).to be_an(Integer)

      expect(response[:daily].first).to have_key(:temp)
      expect(response[:daily].first[:temp]).to be_a(Hash)

      expect(response[:daily].first[:temp]).to have_key(:max)
      expect(response[:daily].first[:temp][:max]).to be_a(Float)

      expect(response[:daily].first[:temp]).to have_key(:min)
      expect(response[:daily].first[:temp][:min]).to be_a(Float)

      expect(response[:daily].first).to have_key(:weather)
      expect(response[:daily].first[:weather]).to be_an(Array)

      expect(response[:daily].first[:weather].first).to have_key(:description)
      expect(response[:daily].first[:weather].first[:description]).to be_a(String)

      expect(response[:daily].first[:weather].first).to have_key(:icon)
      expect(response[:daily].first[:weather].first[:icon]).to be_a(String)
    end

  end

end