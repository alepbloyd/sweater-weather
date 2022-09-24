require 'rails_helper'

RSpec.describe WeatherFacade do

  it 'returns an array of current weather, 5 day weather forecast, and next 8 hours of hourly forecast', :vcr do
    weather = WeatherFacade.get_weather_forecast(38.892,-77.019)

    expect(weather).to be_an(Array)
    expect(weather.count).to eq(3)

    expect(weather.first.count).to eq(1)
    expect(weather.second.count).to eq(5)
    expect(weather.third.count).to eq(8)
  end

end