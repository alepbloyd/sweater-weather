require 'rails_helper'

describe 'session API' do

  it 'returns a user api key with successful login' do
    expect(User.all.count).to eq(0)

    user_params = {
      "email": "whatever@example.com",
      "password": "test123",
      "password_confirmation": "test123"
    }

    headers = {"CONTENT_TYPE" => "application/json"}
    
    post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

    expect(User.all.count).to eq(1)

    session_params = {
      "email": "whatever@example.com",
      "password": "test123"
    }

    post "/api/v1/sessions", headers: headers, params: JSON.generate(session: session_params)

    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful

    expect(data).to have_key(:type)
    expect(data[:type]).to eq("users")

    expect(data).to have_key(:id)
    expect(data[:id].to_i).to be_an(Integer)

    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to be_a(Hash)

    expect(data[:attributes]).to have_key(:email)
    expect(data[:attributes][:email]).to eq("whatever@example.com")

    expect(data[:attributes]).to have_key(:api_key)
    expect(data[:attributes][:api_key]).to be_a(String)
  end

end