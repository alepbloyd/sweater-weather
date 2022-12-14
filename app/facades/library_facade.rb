class LibraryFacade

  def self.book_search(search_string)
    json = LibraryService.book_search(search_string)

    books = json[:docs].map do |book|
      Book.new(book)
    end

    # require 'pry'; binding.pry 

    [json[:numFound],books]
  end

end