require 'rails_helper'

describe 'forecast API' do

  it 'returns the current weather, 5 day forecast, and 8 hour forecast for a searched location', :vcr do
    get "/api/v1/forecast?location=washington,dc"

    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(data).to have_key(:id)
    expect(data[:id]).to eq(nil)

    expect(data).to have_key(:type)
    expect(data[:type]).to eq("forecast")
    
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to be_a(Hash)

    expect(data[:attributes]).to have_key(:current_weather)
    expect(data[:attributes][:current_weather]).to be_a(Hash)

    expect(data[:attributes][:current_weather]).to have_key(:datetime)
    expect(data[:attributes][:current_weather][:datetime]).to be_a(String)

    expect(data[:attributes][:current_weather]).to have_key(:sunrise)
    expect(data[:attributes][:current_weather][:sunrise]).to be_a(String)

    expect(data[:attributes][:current_weather]).to have_key(:temp)
    expect(data[:attributes][:current_weather][:temp]).to be_a(Float)

    expect(data[:attributes][:current_weather]).to have_key(:feels_like)
    expect(data[:attributes][:current_weather][:feels_like]).to be_a(Float)

    expect(data[:attributes][:current_weather]).to have_key(:humidity)
    expect(data[:attributes][:current_weather][:humidity]).to be_an(Integer)

    expect(data[:attributes][:current_weather]).to have_key(:uvi)
    expect(data[:attributes][:current_weather][:uvi].to_f).to be_a(Float)

    expect(data[:attributes][:current_weather]).to have_key(:visibility)
    expect(data[:attributes][:current_weather][:visibility]).to be_an(Integer)

    expect(data[:attributes][:current_weather]).to have_key(:conditions)
    expect(data[:attributes][:current_weather][:conditions]).to be_a(String)

    expect(data[:attributes][:current_weather]).to have_key(:icon)
    expect(data[:attributes][:current_weather][:icon]).to be_a(String)

    daily_weather = data[:attributes][:daily_weather]

    daily_weather.each do |day|
      expect(day).to have_key(:date)
      expect(day[:date]).to be_a(String)

      expect(day).to have_key(:sunrise)
      expect(day[:sunrise]).to be_a(String)

      expect(day).to have_key(:sunset)
      expect(day[:sunset]).to be_a(String)

      expect(day).to have_key(:max_temp)
      expect(day[:max_temp]).to be_a(Float)

      expect(day).to have_key(:min_temp)
      expect(day[:min_temp]).to be_a(Float)

      expect(day).to have_key(:conditions)
      expect(day[:conditions]).to be_a(String)

      expect(day).to have_key(:icon)
      expect(day[:icon]).to be_a(String)
    end

    hourly_weather = data[:attributes][:hourly_weather]

    hourly_weather.each do |hour|
      expect(hour).to have_key(:time)
      expect(hour[:time]).to be_a(String)

      expect(hour).to have_key(:conditions)
      expect(hour[:conditions]).to be_a(String)

      expect(hour).to have_key(:temp)
      expect(hour[:temp].to_f).to be_a(Float)

      expect(hour).to have_key(:icon)
      expect(hour[:icon]).to be_a(String)
    end
  end
end