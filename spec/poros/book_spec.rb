require 'rails_helper'

RSpec.describe Book do

  it 'exists' do
    data = {
      "isbn": [
        "0762507845",
        "9780762507849"
      ],
      "title": "Denver, CO",
      "publisher": "Universal Map Enterprises"
    }

    book = Book.new(data)

    expect(book).to be_a(Book)
    expect(book.isbn).to be_an(Array)
    expect(book.isbn[0]).to eq("0762507845")
    expect(book.isbn[1]).to eq("9780762507849")

    expect(book.title).to eq("Denver, CO")
    
    expect(book.publisher).to eq("Universal Map Enterprises")
  end



end