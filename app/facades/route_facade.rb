class RouteFacade

  def self.get_route(start_string,end_string)
    json = RouteService.get_route(start_string,end_string)

    formatted_time = json[:route][:formattedTime]
    # require 'pry'; binding.pry 
  end

end