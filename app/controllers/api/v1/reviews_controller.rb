module Api
  module V1
    class ReviewsController < ApplicationController
      def index
        @reviews = Review.all
        destination = params[:destination_id]
        author = params[:author]
        if destination
          @reviews = Review.reviews(destination)
        end
        if author
          @reviews = Review.by_author(author)
        end
        json_response(@reviews)
      end

      def show
        @destination = Destination.find(params[:destination_id])
        @review = @destination.reviews.find(params[:id])
        json_response(@review)
      end

      def create
        @destination = Destination.find(params[:destination_id])
        @review = @destination.reviews.create!(review_params)
        json_response(@review, :created)
      end

      def update
        @destination = Destination.find(params[:destination_id])
        @review = @destination.reviews.find(params[:id])
        user_name = @review.author
        # This should correlate with current user of app
        author = params[:author]
        if author == user_name
          if @review.update!(review_params)
            render status: 200, json: {
              message: "Your review has been updated successfully!"
            }
          end
        else
          render status: 404, json: {
            message: "You are not authorized to do this."
          }
        end
      end

      def destroy
        @destination = Destination.find(params[:destination_id])
        @review = @destination.reviews.find(params[:id])
        user_name = @review.author
        # This should correlate with current user of app
        author = params[:author]
        if author == user_name
          if @review.destroy!
            render status: 200, json: {
              message: "Your review has been deleted successfully!"
            }
          end
        else
          render status: 404, json: {
            message: "You are not authorized to do this."
          }
        end
      end

    private

      def review_params
        params.permit(:author, :content, :rating)
      end

    end
  end
end
