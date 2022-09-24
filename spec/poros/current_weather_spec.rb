require 'rails_helper'

RSpec.describe CurrentWeather do

  it 'exists' do
    data = {
      dt: 1664049462,
      sunrise: 1664017051,
      sunset: 1664060560,
      temp: 68.2,
      feels_like: 67.4,
      humidity: 47,
      uvi: 2.51,
      visibility: 10000,
      weather: [{
        description: "scattered clouds",
        icon: "03d"
      }]
    }

    current_weather = CurrentWeather.new(data)

    expect(current_weather).to be_a CurrentWeather
    expect(current_weather.date_time).to eq("24 September 2022, 3:57 PM")
    expect(current_weather.sunrise).to eq("24 September 2022, 6:57 AM")
    expect(current_weather.sunset).to eq("24 September 2022, 7:02 PM")
    expect(current_weather.temp).to eq(68.2)
    expect(current_weather.feels_like).to eq(67.4)
    expect(current_weather.humidity).to eq(47)
    expect(current_weather.uvi).to eq(2.51)
    expect(current_weather.visibility).to eq(10000)
    expect(current_weather.conditions).to eq("scattered clouds")
    expect(current_weather.icon).to eq("03d")
  end

end