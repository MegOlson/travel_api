require 'rails_helper'

describe "get all reviews from single destination" do
  let!(:destinations) { FactoryBot.create(:destination) }
  let!(:reviews) { FactoryBot.create_list(:review, 20, destination: destinations) }

  before { get "/api/v1/destinations/#{destinations.id}/reviews", headers: {Authorization: ENV['TRAVEL_API_KEY']}}

  it 'returns all reviews for a destination' do
    expect(JSON.parse(response.body).size).to eq 20
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

end
