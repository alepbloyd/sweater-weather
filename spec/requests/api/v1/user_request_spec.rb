require 'rails_helper'

describe 'user API' do

  it 'creates a new user' do
    user_params = {
      "email": "whatever@example.com",
      "password": "test123",
      "password_confirmation": "test123"
    }

    headers = {"CONTENT_TYPE" => "application/json"}
    
    post "/api/v1/users", headers: headers, params: JSON.generate(user: user_params)

    created_user = User.last

    data = JSON.parse(response.body, symbolize_names: true)

    # require 'pry'; binding.pry 

  end

end