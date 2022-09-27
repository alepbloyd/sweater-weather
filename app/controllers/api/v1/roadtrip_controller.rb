class Api::V1::RoadtripController < ApplicationController

  def create
    #need api key check still
    roadtrip = RoadtripFacade.road_trip(params[:roadtrip_params][:origin],params[:roadtrip_params][:destination])

    render json: RoadtripSerializer.new(roadtrip).response, status: 200
  end

end