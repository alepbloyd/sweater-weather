class CurrentWeather

  attr_reader :date_time,
              :sunrise,
              :sunset,
              :temp,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(data)

    @date_time = Time.at(data[:dt]).to_datetime.strftime("%d %B %Y, %l:%M %p").squeeze(" ")
    @sunrise = Time.at(data[:sunrise]).to_datetime.strftime("%d %B %Y, %l:%M %p").squeeze(" ")
    @sunset = Time.at(data[:sunset]).to_datetime.strftime("%d %B %Y, %l:%M %p").squeeze(" ")
    @temp = data[:temp]
    @feels_like = data[:feels_like]
    @humidity = data[:humidity]
    @uvi = data[:uvi]
    @visibility = data[:visibility]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]

  end

end