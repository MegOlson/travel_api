require 'rails_helper'

describe "post a quote route", :type => :request do
  before do
    post '/destinations', params: { :city => 'test_city', :country => "test_country" }
  end

  it "returns the destination city" do
    expect(JSON.parse(response.body)['city']).to eq 'test_city'
  end

  it "returns the destination country" do
    expect(JSON.parse(response.body)['country']).to eq 'test_country'
  end

  it "returns a created status" do
    expect(response).to have_http_status(:created)
  end
end
