module Api
  module V1
    class DestinationsController < ApplicationController
      include Response
      def index
        @destinations = Destination.paginate(:page => params[:page], :per_page => 5)
        country = params[:country]
        if country
          @destinations = Destination.search(country)
        end
        json_response(@destinations)
      end

      def show
        @destination = Destination.find(params[:id])
        json_response(@destination)
      end

      def create
        @destination = Destination.create!(destination_params)
        json_response(@destination, :created)
      end

      def update
        @destination = Destination.find(params[:id])
        if @destination.update!(destination_params)
          render status: 200, json: {
            message: "Your destination has been updated successfully!"
          }
        end
      end

      def destroy
        @destination = Destination.find(params[:id])
        if @destination.destroy!
          render status: 200, json: {
            message: "Your destination has been deleted successfully!"
          }
        end
      end

    private

      def destination_params
        params.permit(:city, :country)
      end

    end
  end
end
