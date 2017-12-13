require 'rails_helper'

describe "delete a review route" do

  before do
    @destination = FactoryBot.create(:destination)
    @review = FactoryBot.create(:review, destination: @destination)
  end

  it "returns success code" do
    user_name = @review.author
    delete "/api/v1/destinations/#{@destination.id}/reviews/#{@review.id}", params: {:author => user_name}, headers: {Authorization: ENV['TRAVEL_API_KEY']}
    expect(response).to have_http_status(200)
  end

end
