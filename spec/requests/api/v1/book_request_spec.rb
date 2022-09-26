require 'rails_helper'

RSpec.describe 'book API' do

  it 'returns destination, forecast, count of search results, and information on given quantity of book search results' do
    get "/api/v1/book-search?location=denver,co&quantity=5"

    expect(response).to be_successful
  end

end