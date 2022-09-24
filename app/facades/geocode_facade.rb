class GeocodeFacade

  def self.get_lat_long(search_string)
    json = GeocodeService.get_lat_long(search_string)

    lat = json[:results].first[:locations].first[:latLng][:lat]
    long = json[:results].first[:locations].first[:latLng][:lng]

    [lat,long]
  end

end