require 'rails_helper'

RSpec.describe 'book API' do

  it 'returns destination, forecast, count of search results, and information on given quantity of book search results' do
    get "/api/v1/book-search?location=denver,co&quantity=5"

    expect(response).to be_successful

    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(data).to have_key(:id)
    expect(data[:id]).to eq("null")

    expect(data).to have_key(:type)
    expect(data[:type]).to eq("books")

    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to be_a(Hash)

    expect(data[:attributes]).to have_key(:destination)
    expect(data[:attributes][:destination]).to eq("denver,co")

    expect(data[:attributes]).to have_key(:forecast)
    expect(data[:attributes][:forecast]).to be_a(Hash)

    expect(data[:attributes][:forecast]).to have_key(:summary)
    expect(data[:attributes][:forecast][:summary]).to be_a(String)

    expect(data[:attributes][:forecast]).to have_key(:temperature)
    expect(data[:attributes][:forecast][:temperature]).to be_a(String)

    expect(data[:attributes]).to have_key(:books)
    expect(data[:attributes][:books]).to be_an(Array)

    expect(data[:attributes][:books].count).to eq(5)

    data[:attributes][:books].each do |book|
      expect(book).to have_key(:isbn)
      expect(book[:isbn]).to be_an(Array)

      expect(book[:isbn].count).to eq(2)

      expect(book).to have_key(:title)
      expect(book[:title]).to be_a(String)

      expect(book).to have_key(:publisher)
      expect(book[:publisher]).to be_an(Array)
      expect(book[:publisher].first).to be_a(String)
    end
  end

end