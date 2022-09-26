class Api::V1::RoadtripController < ApplicationController

  def create
    # require 'pry'; binding.pry
    roadtrip = Roadtrip.new(params)

    render json: RoadtripSerializer.new(params).response, status: 200
  end

  private

  # def roadtrip_params
  #   params.require(:roadtrip).permit(:origin)
  # end

end