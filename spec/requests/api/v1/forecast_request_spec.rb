require 'rails_helper'

describe 'forecast API' do

  it 'returns the current weather, 5 day forecast, and 8 hour forecast for a searched location' do
    get "/api/v1/forecast?location=washington,dc"

    expect(response).to be_successful
  end
end