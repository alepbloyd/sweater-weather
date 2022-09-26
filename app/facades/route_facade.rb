class RouteFacade

  def self.get_route(start_string,end_string)
    json = RouteService.get_route(start_string,end_string)

    travel_time = json[:route][:formattedTime]
  end

end