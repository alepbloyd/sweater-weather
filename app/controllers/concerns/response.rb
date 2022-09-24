module Response

  def forecast_json_response(object, status = :ok)
    ForecastSerializer.new(object).response
  end

end