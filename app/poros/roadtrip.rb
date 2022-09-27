class Roadtrip

  attr_reader :start_city,
              :end_city,
              :travel_time,
              :temperature,
              :conditions

  def initialize(start_city,end_city,travel_time,forecast)
    # require 'pry'; binding.pry 
    @start_city = start_city
    @end_city = end_city
    @travel_time = travel_time
    @temperature = forecast.temp
    @conditions = forecast.conditions
  end

end