require 'rails_helper'

RSpec.describe LibraryService do

  context "#book_search" do
    it 'returns given quantity of books related to given search term' do
      response = LibraryService.book_search("Denver,CO")

      expect(response).to be_a(Hash)

      expect(response).to have_key(:numFound)
      expect(response[:numFound]).to be_an(Integer)

      expect(response).to have_key(:docs)
      expect(response[:docs]).to be_an(Array)

      expect(response[:docs].first).to have_key(:isbn)
      expect(response[:docs].first[:isbn]).to be_an(Array)

      expect(response[:docs].first[:isbn][0].to_i).to be_an(Integer)
      expect(response[:docs].first[:isbn][1].to_i).to be_an(Integer)

      expect(response[:docs].first).to have_key(:title)
      expect(response[:docs].first[:title]).to be_a(String)

      expect(response[:docs].first).to have_key(:publisher)
      expect(response[:docs].first[:publisher]).to be_an(Array)
      expect(response[:docs].first[:publisher][0]).to be_a(String)
    end
  end

end