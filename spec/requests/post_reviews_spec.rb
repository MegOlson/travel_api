require "rails_helper"

describe 'post a reviews route' do
  let!(:destination) { FactoryBot.create(:destination)}

  before do
    post "/api/v1/destinations/#{destination.id}/reviews", params: { author: 'Test Author', content: "Test Content", rating: 2}, headers: {Authorization: ENV['TRAVEL_API_KEY']}
  end

  it 'returns the review rating' do
    expect(JSON.parse(response.body)['rating']).to eq 2
  end

  it "returns a created status" do
    expect(response).to have_http_status(:created)
  end
end
