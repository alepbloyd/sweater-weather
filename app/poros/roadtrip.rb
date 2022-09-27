class Roadtrip

  attr_reader :start_city,
              :end_city,
              :travel_time,
              :temperature,
              :conditions

  def initialize(start_city,end_city,travel_time,forecast)
    @start_city = start_city
    @end_city = end_city
    @travel_time = travel_time
    if forecast.class == DailyWeather
      @temperature = (forecast.max_temp + forecast.min_temp) / 2
    elsif forecast.class == HourlyWeather
      @temperature = forecast.temp
    end
    @conditions = forecast.conditions
  end

end