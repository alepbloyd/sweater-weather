require 'rails_helper'

RSpec.describe DailyWeather do

  it 'exists' do
    data = {:dt=>1664121600,
            :sunrise=>1664103505,
            :sunset=>1664146863,
            :moonrise=>1664101800,
            :moonset=>1664147520,
            :moon_phase=>0,
            :temp=>
              {:day=>79.41,
              :min=>58.32,
              :max=>81.5,
              :night=>61.21,
              :eve=>63.88,
              :morn=>58.64},
            :feels_like=>
              {:day=>79.41,
              :night=>61.65,
              :eve=>63.91,
              :morn=>56.98},
            :pressure=>1007,
            :humidity=>42,
            :dew_point=>53.76,
            :wind_speed=>12.03,
            :wind_deg=>336,
            :wind_gust=>27.38,
            :weather=>
              [{:id=>502,
                :main=>"Rain",
                :description=>"heavy intensity rain",
                :icon=>"10d"}],
            :clouds=>88,
            :pop=>1,
            :rain=>9.14,
            :uvi=>3.14
    }

    daily_weather = DailyWeather.new(data)

    expect(daily_weather).to be_a DailyWeather

    expect(daily_weather.date_time).to eq("25 September 2022, 12:00 PM")
    expect(daily_weather.sunrise).to eq("25 September 2022, 6:58 AM")
    expect(daily_weather.sunset).to eq('25 September 2022, 7:01 PM')
    expect(daily_weather.max_temp).to eq(81.5)
    expect(daily_weather.min_temp).to eq(58.32)
    expect(daily_weather.conditions).to eq('heavy intensity rain')
    expect(daily_weather.icon).to eq('10d')
  end

end