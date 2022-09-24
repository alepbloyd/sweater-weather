class DailyWeather

  attr_reader :date_time,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @date_time = Time.at(data[:dt]).to_datetime.strftime("%d %B %Y, %l:%M %p").squeeze(" ")
    @sunrise = Time.at(data[:sunrise]).to_datetime.strftime("%d %B %Y, %l:%M %p").squeeze(" ")
    @sunset = Time.at(data[:sunset]).to_datetime.strftime("%d %B %Y, %l:%M %p").squeeze(" ")
    @max_temp = data[:temp][:max]
    @min_temp = data[:temp][:min]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end

end