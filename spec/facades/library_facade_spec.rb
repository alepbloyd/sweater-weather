require 'rails_helper'

RSpec.describe LibraryFacade do

  it 'returns total number of books found and array of books' do
    results = LibraryFacade.book_search("Denver,CO")

    expect(results.first).to be_an(Integer)
    expect(results.last).to be_an(Array)
  end

end