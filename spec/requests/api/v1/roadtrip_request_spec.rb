require 'rails_helper'

describe 'roadtrip API' do

  before :each do
    @user_params = {
      "email": "whatever@example.com",
      "password": "test123",
      "password_confirmation": "test123"
    }

    @headers = {"CONTENT_TYPE" => "application/json"}
    
    post "/api/v1/users", headers: @headers, params: JSON.generate(user: @user_params)

    data = JSON.parse(response.body, symbolize_names: true)[:data]

    @api_key = data[:attributes][:api_key]
  end

  it 'returns a successful response for a good request' do

    roadtrip_params = {
      "origin": "Washington,DC",
      "destination": "Boston,MA",
      "api_key": @api_key
    }

    headers = {"CONTENT_TYPE" => "application/json"}
    
    post "/api/v1/road_trip", headers: headers, params: JSON.generate(roadtrip_params: roadtrip_params)

    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)[:data]

    require 'pry'; binding.pry 

    # expect(data).to be_a Hash

    # expect(data).to have_key(:id)
    # expect(data[:id]).to_be nil

    # expect(data).to have_key(:type)
    # expect(data[:type]).to eq("roadtrip")

    # expect(data).to have_key(:attributes)
    # expect(data[:attributes]).to be_a(Hash)

    # expect(data[:attributes]).to have_key(:start_city)
    # expect(data[:attributes][:start_city]).to eq("Washington, DC")

    # expect(data[:attributes]).to have_key(:end_city)
    # expect(data[:attributes][:start_city]).to eq("Boston, MA")

    # expect(data[:attributes]).to have_key(:travel_time)
    # expect(data[:attributes][:travel_time]).to be_a(String)

    # expect(data[:attributes]).to have_key(:weather_at_eta)
    # expect(data[:attributes][:weather_at_eta]).to be_a(Hash)

    # expect(data[:attributes][:weather_at_eta]).to have_key(:temperature)
    # expect(data[:attributes][:weather_at_eta][:temperature]).to be_a(Float)

    # expect(data[:attributes][:weather_at_eta]).to have_key(:conditions)
    # expect(data[:attributes][:weather_at_eta][:conditions]).to be_a(String)


  end

end