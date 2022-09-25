require 'rails_helper'

describe 'user API' do

  it 'creates a new user' do
    expect(User.all.count).to eq(0)

    user_params = {
      "email": "whatever@example.com",
      "password": "test123",
      "password_confirmation": "test123"
    }

    headers = {"CONTENT_TYPE" => "application/json"}
    
    post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

    created_user = User.last

    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(User.all.count).to eq(1)

    expect(data).to have_key(:type)
    expect(data[:type]).to eq("users")

    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to be_a(Hash)

    expect(data[:attributes]).to have_key(:email)
    expect(data[:attributes][:email]).to eq("whatever@example.com")

    expect(data[:attributes]).to have_key(:api_key)
    expect(data[:attributes][:api_key]).to be_a(String)
  end

  it 'does not create a user if email is already taken' do
    expect(User.all.count).to eq(0)

    user_params = {
      "email": "whatever@example.com",
      "password": "test123",
      "password_confirmation": "test123"
    }

    headers = {"CONTENT_TYPE" => "application/json"}
    
    post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

    expect(User.all.count).to eq(1)

    user_params_2 = {
      "email": "whatever@example.com",
      "password": "test12345",
      "password_confirmation": "test12345"
    }

    post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params_2)

    expect(response).to_not be_successful

    expect(User.all.count).to eq(1)

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data).to have_key(:error)
    expect(data[:error]).to eq("Oops user creation failed (email taken)")
  end

  it 'does not create a user if email is already taken' do
    expect(User.all.count).to eq(0)

    user_params = {
      "email": "whatever@example.com",
      "password": "test123",
      "password_confirmation": "321tset"
    }

    headers = {"CONTENT_TYPE" => "application/json"}
    
    post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

    expect(User.all.count).to eq(0)

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data).to have_key(:error)
    expect(data[:error]).to eq("Oops user creation failed (password and confirmation mismatch")
  end

end