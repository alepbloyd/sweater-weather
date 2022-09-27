class Api::V1::RoadtripController < ApplicationController

  def create
    # require 'pry'; binding.pry 
    if params[:roadtrip_params][:api_key].empty?
      render :json => {:error => "API key missing"}, :status => 401
    elsif User.exists?(api_key: params[:roadtrip_params][:api_key]) == false
      render :json => {:error => "Invalid API key"}, :status => 401
    else
      roadtrip = RoadtripFacade.road_trip(params[:roadtrip_params][:origin],params[:roadtrip_params][:destination])

      render json: RoadtripSerializer.new(roadtrip).response, status: 200
    end
  end

end