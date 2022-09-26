class LibraryService

  def self.book_search(search_location)
    response = BaseService.book_search.get("?q=#{search_location}")
    JSON.parse(response.body, symbolize_names: true)
  end

end