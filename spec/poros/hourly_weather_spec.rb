require 'rails_helper'

RSpec.describe HourlyWeather do

  it 'exists' do
    data = {:dt=>1664053200,
            :temp=>68.23,
            :feels_like=>66.97,
            :pressure=>1015,
            :humidity=>47,
            :dew_point=>47.26,
            :uvi=>1.17,
            :clouds=>75,
            :visibility=>10000,
            :wind_speed=>7.49,
            :wind_deg=>230,
            :wind_gust=>9.64,
            :weather=>
              [{:id=>803,
                :main=>"Clouds",
                :description=>"broken clouds",
                :icon=>"04d"}],
            :pop=>0
      }
      
    hourly_weather = HourlyWeather.new(data)

    expect(hourly_weather).to be_an HourlyWeather

    expect(hourly_weather.time).to eq("5:00 PM")
    expect(hourly_weather.temp).to eq(68.23)
    expect(hourly_weather.conditions).to eq('broken clouds')
    expect(hourly_weather.icon).to eq("04d")
  end

end