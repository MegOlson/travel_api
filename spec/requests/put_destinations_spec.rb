require 'rails_helper'

describe "put a destination route", :type => :request do

  before do

    @destination = FactoryBot.create(:destination)
    @destination.reload
  end

  it "returns success response" do
    put "/api/v1/destinations/#{@destination.id}", params: {:city => "New Test City"}, headers: {Authorization: 'Basic ZGhoOnBhc3N3b3Jk'}
    binding.pry
    expect(response).to have_http_status(200)
  end

end
