require 'rails_helper'

describe 'road_trip API' do

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
    road_trip_params = {
      "origin": "Denver,CO",
      "destination": "Pueblo,CO",
      "api_key": @api_key
    }

    
  end

end