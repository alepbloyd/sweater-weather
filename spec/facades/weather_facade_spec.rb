require 'rails_helper'

RSpec.describe WeatherFacade do

  it 'returns a current weather object', :vcr do
    current_weather = WeatherFacade.get_weather_forecast(38.892,-77.019)

    expect(current_weather).to be_an(Array)
  end

end