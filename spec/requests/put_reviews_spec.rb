require 'rails_helper'

describe "put a review route", :type => :request do

  before do
    @destination = FactoryBot.create(:destination)
    @review = FactoryBot.create(:review, destination: @destination)
  end

  it "returns a success response" do
    user_name = @review.author
    put "/api/v1/destinations/#{@destination.id}/reviews/#{@review.id}", params: {:rating => 3, :author => user_name}, headers: {Authorization: 'Basic ZGhoOnBhc3N3b3Jk'}
    expect(response).to have_http_status(200)
  end

end
