class BookSearchSerializer

  def initialize(location,result_count,books,forecast)
    @destination = location
    @result_count = result_count
    @books = books
    @conditions = forecast.first.first.conditions
    @temperature = "#{forecast.first.first.temp} F"
  end
end