class BookSearchSerializer
  
  def initialize(location,result_count,books,forecast)
    @destination = location
    @result_count = result_count
    @books = books
    @conditions = forecast.first.first.conditions
    @temperature = "#{forecast.first.first.temp} F"
    # require 'pry'; binding.pry 
  end

  def response
    {
      "data": {
        "id": "null",
        "type": "books",
        "attributes": {
          "destination": @destination,
          "forecast": {
            "summary": @conditions,
            "temperature": @temperature
          },
          "total_books_found": @result_count,
          "books": book_array
        }
      }
    }
  end

  def book_array
    result = []
    
    @books.each do |book|
      result << {
        "isbn": book.isbn,
        "title": book.title,
        "publisher": book.publisher
      }
    end

    result
  end
end