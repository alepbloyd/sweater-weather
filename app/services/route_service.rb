class RouteService

  def self.get_route(start_string,end_string)
    response = BaseService.route_service.get("?key=#{ENV['mapquest_api']}&from=#{start_string}&to=#{end_string}")
    JSON.parse(response.body, symbolize_names: true)
  end

end