require 'rails_helper'

describe 'user API' do

  it 'creates a new user' do
    user_params = {
      "email": "whatever@example.com",
      "password": "test123",
      "password_confirmation": "test123"
    }

    headers = {"CONTENT_TYPE" => "application/json"}
    
    x = post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

    created_user = User.last

    # created_user = User.last
  end

end