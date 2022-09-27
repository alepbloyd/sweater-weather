require 'rails_helper'

RSpec.describe Roadtrip do

  it 'exists' do
    
    start_city = "Washington,DC"
    end_city = "Richmond,VA"
    travel_time = "04:15:12"

    hourly_weather_data = {:dt=>1664053200,
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

    forecast = HourlyWeather.new(hourly_weather_data)

    road_trip = Roadtrip.new(start_city,end_city,travel_time,forecast)

    expect(road_trip).to be_a(Roadtrip)

    expect(road_trip.start_city).to eq("Washington,DC")
    expect(road_trip.end_city).to eq("Richmond,VA")
    expect(road_trip.travel_time).to eq("04:15:12")
    expect(road_trip.temperature).to eq(68.23)
    expect(road_trip.conditions).to eq("broken clouds")

    # expect(road_trip.)

  end

end