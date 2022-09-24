class GeocodeService

  def self.get_lat_long(search_string)
    response = BaseService.geocode_service.get("?key=#{ENV['mapquest_api']}&location=#{search_string}")
    JSON.parse(response.body, symbolize_names: true)
  end

end