class DestinationsController < ApplicationController

  def index
    @destinations = {"destination": "Paris, France"}
    json_response(@destinations)
  end

private

  def json_response(object)
    render json: object, status: :ok
  end

end
