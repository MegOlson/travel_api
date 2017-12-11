class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
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
    if @review.update!(review_params)
      render status: 200, json: {
        message: "Your review has been updated successfully!"
      }
    end
  end

  def destroy
    @destination = Destination.find(params[:destination_id])
    @review = @destination.reviews.find(params[:id])
    if @review.destroy!
      render status: 200, json: {
        message: "Your review has been deleted successfully!"
      }
    end
  end

private

  def review_params
    params.permit(:author, :content, :rating)
  end

end
